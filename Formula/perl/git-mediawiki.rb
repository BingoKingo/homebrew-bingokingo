class GitMediawiki < Formula
  desc "Gate between Git and Mediawiki"
  homepage "https://github.com/moy/Git-Mediawiki/"
  license "GPL-2.0-or-later"
  head "https://github.com/moy/Git-Mediawiki.git", branch: "master"

  depends_on "git"

  uses_from_macos "perl"

  resource "MediaWiki::API" do
    url "https://cpan.metacpan.org/authors/id/E/EX/EXOBUZZ/MediaWiki-API-0.52.tar.gz"
    sha256 "2f50a9d85ebf6f12bac9e09f52bcfead2cf419802c15191b172724ee2f49d0c2"
  end

  resource "DateTime::Format::Builder" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-Format-Builder-0.83.tar.gz"
    sha256 "61ffb23d85b3ca1786b2da3289e99b57e0625fe0e49db02a6dc0cb62c689e2f2"
  end

  resource "DateTime::Format::ISO8601" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-Format-ISO8601-0.17.tar.gz"
    sha256 "04899f3b1896b2e0933a1d728b3094ccd2f7d09e434c4eac2696cd931bbf0551"
  end

  resource "DateTime::Locale" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-Locale-1.45.tar.gz"
    sha256 "1bc56dc2ff4b3152612e1d474ca65071ae2c00912e3fa4bc6f5a99e5e7a1da68"
  end

  resource "DateTime::Format::Strptime" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-Format-Strptime-1.79.tar.gz"
    sha256 "701e46802c86ed4d88695c1a6dacbbe90b3390beeb794f387e7c792300037579"
  end

  resource "LWP::Protocol::https" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/LWP-Protocol-https-6.14.tar.gz"
    sha256 "59cdeabf26950d4f1bef70f096b0d77c5b1c5a7b5ad1b66d71b681ba279cbb2a"
  end

  resource "Parallel::ForkManager" do
    url "https://cpan.metacpan.org/authors/id/Y/YA/YANICK/Parallel-ForkManager-2.04.tar.gz"
    sha256 "606894fc2e9f7cd13d9ec099aaac103a8f0943d1d80c2c486bae14730a39b7fc"
  end

  patch :DATA

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", libexec/"lib"
    ENV.prepend_path "PERL5LIB", Formula["git"].prefix/"share/perl5"

    resource("MediaWiki::API").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("DateTime::Format::Builder").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("DateTime::Format::ISO8601").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("DateTime::Locale").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("DateTime::Format::Strptime").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("LWP::Protocol::https").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("Parallel::ForkManager").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    bin.install "git-remote-mediawiki"
    bin.install "git-mw"

    (libexec/"lib/Git").install "Git/Mediawiki.pm"
    bin.env_script_all_files(libexec/"bin", PERL5LIB: ENV.fetch("PERL5LIB", nil))
  end

  def caveats
    <<~EOS
      [M] Modified version with parallel workers and some fix.
    EOS
  end

  test do
    output = shell_output("#{bin}/git-mw help")
    assert_match "usage", output
    assert_match "commands", output
  end
end
__END__
diff --git a/Git/Mediawiki.pm b/Git/Mediawiki.pm
index 7dc2602..8733949 100644
--- a/Git/Mediawiki.pm
+++ b/Git/Mediawiki.pm
@@ -4,6 +4,8 @@ require v5.26;
 use strict;
 use POSIX;
 use Git;
+use Time::HiRes qw(sleep);
+use URI;
 
 use strict;
 use warnings;
@@ -20,8 +22,9 @@ BEGIN {
 	@ISA = qw(Exporter);
 
 	# Methods which can be called as standalone functions as well:
-	@EXPORT_OK = qw(clean_filename smudge_filename connect_maybe
-									EMPTY HTTP_CODE_OK HTTP_CODE_PAGE_NOT_FOUND);
+	@EXPORT_OK = qw(escape_author clean_filename smudge_filename connect_maybe serialize_cookie_jar
+									EMPTY HTTP_CODE_OK HTTP_CODE_PAGE_NOT_FOUND HTTP_CODE_FORBIDDEN
+									HTTP_CODE_TOO_MANY_REQUESTS);
 }
 
 # Mediawiki filenames can contain forward slashes. This variable decides by which pattern they should be replaced
@@ -33,6 +36,20 @@ use constant EMPTY => q{};
 # HTTP codes
 use constant HTTP_CODE_OK => 200;
 use constant HTTP_CODE_PAGE_NOT_FOUND => 404;
+use constant HTTP_CODE_FORBIDDEN => 403;
+use constant HTTP_CODE_TOO_MANY_REQUESTS => 429;
+
+# Retry configuration for rate limiting
+use constant MAX_RETRIES => 10;
+use constant BASE_DELAY => 5; # seconds
+use constant MAX_DELAY => 120; # seconds
+use constant JITTER_FACTOR => 0.5; # Add up to 50% jitter
+
+sub escape_author {
+    my $string = shift;
+    $string =~ s/([<>@])/uri_escape($1)/ge;
+    return $string;
+}
 
 sub clean_filename {
 	my $filename = shift;
@@ -65,6 +82,7 @@ sub connect_maybe {
 
 	my $remote_name = shift;
 	my $remote_url = shift;
+	my $cookie_jar_str = shift;
 	my ($wiki_login, $wiki_password, $wiki_domain);
 
 	$wiki_login = Git::config("remote.${remote_name}.mwLogin");
@@ -72,12 +90,57 @@ sub connect_maybe {
 	$wiki_domain = Git::config("remote.${remote_name}.mwDomain");
 
 	$wiki = MediaWiki::API->new;
-
-	$wiki->{ua}->agent("git-mediawiki/$Git::Mediawiki::VERSION " . $wiki->{ua}->agent());
+	# $wiki->{ua}->agent("git-mediawiki/$Git::Mediawiki::VERSION " . $wiki->{ua}->agent());
+	$wiki->{ua}->agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36");
 	$wiki->{ua}->conn_cache({total_capacity => undef});
+	$wiki->{ua}->default_header('Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
+	$wiki->{ua}->default_header('Accept-Language' => 'en-US,en;q=0.9');
+	$wiki->{ua}->default_header('Accept-Encoding' => 'gzip, deflate');
+	$wiki->{ua}->default_header('Connection' => 'keep-alive');
+	
+	require HTTP::Cookies;
+	my $cookie_jar = HTTP::Cookies->new();
+	
+	if ($cookie_jar_str) {
+		$cookie_jar->load(\$cookie_jar_str);
+	}
+	
+	my $extra_cookies = Git::config("remote.${remote_name}.mwCookies");
+	if ($extra_cookies) {
+		chomp($extra_cookies);
+		my @cookie_list = split(/;/, $extra_cookies);
+		my $uri = URI->new($remote_url);
+		my $host = $uri->host;
+		my $path = $uri->path || '/';
+		
+		foreach my $cookie_str (@cookie_list) {
+			$cookie_str =~ s/^\s+|\s+$//g;
+			my ($name, $value) = split(/=/, $cookie_str, 2);
+			next unless $name && defined $value;
+			
+			$cookie_jar->set_cookie(
+				1,
+				$name,
+				$value,
+				$path,
+				$host,
+				undef,
+				0,
+				0,
+				86400,
+				0
+			);
+		}
+	}
+	
+	$wiki->{ua}->cookie_jar($cookie_jar);
 
 	$wiki->{config}->{api_url} = "${remote_url}/api.php";
-	if ($wiki_login) {
+
+	my $retry_count = 0;
+	my $delay = BASE_DELAY;
+
+	if ($wiki_login && !$cookie_jar_str) {
 		my %credential = (
 			'url' => $remote_url,
 			'username' => $wiki_login,
@@ -85,12 +148,38 @@ sub connect_maybe {
 		);
 		Git::credential(\%credential);
 		my $request = {lgname => $credential{username},
-										lgpassword => $credential{password},
-										lgdomain => $wiki_domain};
-		if ($wiki->login($request)) {
+									lgpassword => $credential{password},
+									lgdomain => $wiki_domain};
+
+		RETRY_LOGIN:
+		my $login_result = $wiki->login($request);
+		if ($login_result) {
 			Git::credential(\%credential, 'approve');
 			print {*STDERR} qq(Logged in mediawiki user "$credential{username}".\n);
 		} else {
+			my $http_code = undef;
+			my $retry_after = undef;
+			if (defined $wiki->{response} && ref($wiki->{response}) eq 'HTTP::Response') {
+				$http_code = $wiki->{response}->code;
+				$retry_after = $wiki->{response}->header('Retry-After');
+			}
+			if (defined $http_code && $http_code == HTTP_CODE_TOO_MANY_REQUESTS && $retry_count < MAX_RETRIES) {
+				my $wait_time = defined $retry_after ? $retry_after : $delay;
+				$wait_time = $wait_time > MAX_DELAY ? MAX_DELAY : $wait_time;
+				
+				my $jitter = $wait_time * JITTER_FACTOR * rand();
+				$wait_time += $jitter;
+				
+				my $wait_time_int = int($wait_time + 0.5);
+
+				print {*STDERR} qq(Rate limited (429), retrying after ${wait_time_int} seconds...\n);
+				sleep($wait_time);
+
+				$retry_count++;
+				$delay *= 2;
+				goto RETRY_LOGIN;
+			}
+
 			print {*STDERR} qq(Failed to log in mediawiki user "$credential{username}" on ${remote_url}\n);
 			print {*STDERR} '  (error ' .
 				$wiki->{error}->{code} . ': ' .
@@ -103,4 +192,14 @@ sub connect_maybe {
 	return $wiki;
 }
 
-1;															# Famous last words
+sub serialize_cookie_jar {
+	my $wiki = shift;
+	my $cookie_jar = $wiki->{ua}->cookie_jar;
+	return unless $cookie_jar;
+	
+	my $cookie_str;
+	$cookie_jar->save(\$cookie_str);
+	return $cookie_str;
+}
+
+1;															# Famous last words
\ No newline at end of file
diff --git a/docs/User-manual.md b/docs/User-manual.md
index 699c82b..024fffb 100644
--- a/docs/User-manual.md
+++ b/docs/User-manual.md
@@ -8,6 +8,7 @@ You need to have the following Perl packages installed:
 
 * __MediaWiki::API__ (recent version. Version 0.39 works. Version 0.34 won't work with mediafiles)
 * __DateTime::Format::ISO8601__
+* __LWP::Protocol::https__ (for TLS access)
 
 On many distributions of Linux, these can be installed from packages `libmediawiki-api-perl` and `libdatetime-format-iso8601-perl`, respectively.
 
@@ -60,6 +61,8 @@ Alternatively, you may install Git-Mediawiki manually:
 Then, the first operation you should do is cloning the remote mediawiki. To do so, run the command
 
     git clone mediawiki::http://yourwikiadress.com
+		
+*Note: Only the main namespace is fetched this way! How to expand the clone to more namespaces, *
 
 You can commit your changes locally as usual with the command
 
@@ -94,7 +97,7 @@ By default, only the main namespace is inspected. But you can also specify other
 
 ### Shallow imports
 
-It is also possible to import only the last revision of a wiki. This is done using the `remote.origin.shallow` configuration variable. To set it during a clone, use:
+It is also possible to import only the last revision of a wiki. This is done using the `remote.origin.shallow` configuration variable. To apply the variable once during the clone, use:
 
     git -c remote.origin.shallow=true clone mediawiki::http://example.com/wiki/
 
@@ -106,7 +109,8 @@ Alternatively, you may let clone write the value to the `.git/config` file to ha
 
 ## Authentication
 
-Some wiki require login/password. You can specify a login and password using the `remote.origin.mwLogin` and `remote.origin.mwPassword` configuration variables. If you need to do that at clone time, the best way is
+Some wiki require login/password. You can specify a login and password using the `remote.origin.mwLogin` and `remote.origin.mwPassword` configuration variables. You should not use your real password but create a `bot password` that has restricted rights. To create a bot password, visit `Special:Botpasswords` in your wiki.
+If you need the authentication at clone time, the best way is
 
     git init new-repo
     chmod 600 .git/config # you're going to put a password there
diff --git a/git-remote-mediawiki b/git-remote-mediawiki
index 4f55c5c..232895a 100755
--- a/git-remote-mediawiki
+++ b/git-remote-mediawiki
@@ -17,8 +17,10 @@ use lib (split(/:/, $ENV{GITPERLLIB} || ""));
 
 use MediaWiki::API;
 use Git;
-use Git::Mediawiki qw(clean_filename smudge_filename connect_maybe EMPTY HTTP_CODE_OK);
+use Git::Mediawiki qw(escape_author clean_filename smudge_filename connect_maybe serialize_cookie_jar EMPTY HTTP_CODE_OK HTTP_CODE_FORBIDDEN HTTP_CODE_TOO_MANY_REQUESTS);
 use DateTime::Format::ISO8601;
+use Parallel::ForkManager;
+use Time::HiRes qw(sleep);
 use warnings;
 
 # By default, use UTF-8 to communicate with Git and the user
@@ -53,6 +55,101 @@ use constant SLICE_SIZE => 50;
 # the number of links to be returned (500 links max).
 use constant BATCH_SIZE => 10;
 
+# Number of parallel workers for API requests
+# According to MediaWiki API best practices, limit to 4 concurrent requests
+use constant DEFAULT_PARALLEL_WORKERS => 4;
+
+# Retry configuration for 403/429 errors
+use constant MAX_RETRIES => 10;
+use constant BASE_DELAY => 5; # seconds
+use constant MAX_DELAY => 120; # seconds
+use constant JITTER_FACTOR => 0.5; # Add up to 50% jitter
+
+sub log_info { print {*STDERR} "[INFO] ", @_; }
+sub log_warning { print {*STDERR} "[WARN] ", @_; }
+sub log_error { print {*STDERR} "[ERROR] ", @_; }
+sub log_fatal { print {*STDERR} "[FATAL] ", @_; }
+
+sub api_request_with_retry {
+	my ($wiki, $query, $action_desc) = @_;
+	my $retry_count = 0;
+	my $delay = BASE_DELAY;
+
+	RETRY_REQUEST:
+	my $result = $wiki->api($query);
+
+	if (!defined $result) {
+		my $http_code = undef;
+		my $retry_after = undef;
+		my $error_msg = '';
+
+		if (defined $wiki->{response} && ref($wiki->{response}) eq 'HTTP::Response') {
+			$http_code = $wiki->{response}->code;
+			$retry_after = $wiki->{response}->header('Retry-After');
+			$error_msg = $wiki->{response}->message;
+		}
+
+		if (defined $http_code && ($http_code == HTTP_CODE_FORBIDDEN || $http_code == HTTP_CODE_TOO_MANY_REQUESTS) && $retry_count < MAX_RETRIES) {
+			my $wait_time = defined $retry_after ? $retry_after : $delay;
+			$wait_time = $wait_time > MAX_DELAY ? MAX_DELAY : $wait_time;
+			
+			my $jitter = $wait_time * JITTER_FACTOR * rand();
+			$wait_time += $jitter;
+			
+			my $wait_time_int = int($wait_time + 0.5);
+
+			log_warning("Request blocked (HTTP $http_code): $error_msg, retrying after ${wait_time_int} seconds...\n");
+			sleep($wait_time);
+
+			$retry_count++;
+			$delay *= 2;
+			goto RETRY_REQUEST;
+		}
+	}
+
+	return $result;
+}
+
+sub list_request_with_retry {
+	my ($wiki, $query, $action_desc) = @_;
+	my $retry_count = 0;
+	my $delay = BASE_DELAY;
+
+	RETRY_REQUEST:
+	my $result = $wiki->list($query);
+
+	if (!defined $result) {
+		my $http_code = undef;
+		my $retry_after = undef;
+		my $error_msg = '';
+
+		if (defined $wiki->{response} && ref($wiki->{response}) eq 'HTTP::Response') {
+			$http_code = $wiki->{response}->code;
+			$retry_after = $wiki->{response}->header('Retry-After');
+			$error_msg = $wiki->{response}->message;
+		}
+
+		if (defined $http_code && ($http_code == HTTP_CODE_FORBIDDEN || $http_code == HTTP_CODE_TOO_MANY_REQUESTS) && $retry_count < MAX_RETRIES) {
+			my $wait_time = defined $retry_after ? $retry_after : $delay;
+			$wait_time = $wait_time > MAX_DELAY ? MAX_DELAY : $wait_time;
+			
+			my $jitter = $wait_time * JITTER_FACTOR * rand();
+			$wait_time += $jitter;
+			
+			my $wait_time_int = int($wait_time + 0.5);
+
+			log_warning("Request blocked (HTTP $http_code): $error_msg, retrying after ${wait_time_int} seconds...\n");
+			sleep($wait_time);
+
+			$retry_count++;
+			$delay *= 2;
+			goto RETRY_REQUEST;
+		}
+	}
+
+	return $result;
+}
+
 if (@ARGV != 2) {
 	exit_error_usage();
 }
@@ -104,10 +201,18 @@ $shallow_import = ($shallow_import eq 'true');
 # - by_rev: perform one query per new revision on the remote wiki
 # - by_page: query each tracked page for new revision
 my $fetch_strategy = run_git_quoted(["config", "--get", "remote.${remotename}.fetchStrategy"]);
-if (!$fetch_strategy) {
-	$fetch_strategy = run_git_quoted(["config", "--get", "mediawiki.fetchStrategy"]);
-}
-chomp($fetch_strategy);
+	if (!$fetch_strategy) {
+		$fetch_strategy = run_git_quoted(["config", "--get", "mediawiki.fetchStrategy"]);
+	}
+	chomp($fetch_strategy);
+
+	# Number of parallel workers for fetching pages/revisions
+	my $parallel_workers = run_git_quoted(["config", "--get", "remote.${remotename}.parallelWorkers"]);
+	if (!$parallel_workers) {
+		$parallel_workers = run_git_quoted(["config", "--get", "mediawiki.parallelWorkers"]);
+	}
+	chomp($parallel_workers);
+	$parallel_workers = ($parallel_workers =~ /^\d+$/) ? $parallel_workers : DEFAULT_PARALLEL_WORKERS;
 
 # Force by_page if we are given a set of pages.
 #
@@ -137,9 +242,9 @@ my %basetimestamps;
 # deterministic, this means everybody gets the same sha1 for each
 # MediaWiki revision.
 my $dumb_push = run_git_quoted(["config", "--get", "--bool", "remote.${remotename}.dumbPush"]);
-if (!$dumb_push) {
-	$dumb_push = run_git_quoted(["config", "--get", "--bool", "mediawiki.dumbPush"]);
-}
+	if (!$dumb_push) {
+		$dumb_push = run_git_quoted(["config", "--get", "--bool", "mediawiki.dumbPush"]);
+	}
 chomp($dumb_push);
 $dumb_push = ($dumb_push eq 'true');
 
@@ -203,7 +308,7 @@ sub parse_command {
 	} elsif ($cmd[0] eq 'push') {
 		mw_push($cmd[1]);
 	} else {
-		print {*STDERR} "Unknown command. Aborting...\n";
+		log_error("Unknown command. Aborting...\n");
 		return 0;
 	}
 	return 1;
@@ -259,13 +364,14 @@ sub get_mw_tracked_categories {
 			# to specify it.
 			$category = "Category:${category}";
 		}
-		my $mw_pages = $mediawiki->list( {
+		my $mw_pages = list_request_with_retry($mediawiki, {
 			action => 'query',
 			list => 'categorymembers',
 			cmtitle => $category,
-			cmlimit => 'max' } )
-			|| die $mediawiki->{error}->{code} . ': '
-				. $mediawiki->{error}->{details} . "\n";
+			cmlimit => 'max' }, "get category members");
+		if (!defined($mw_pages)) {
+			die $mediawiki->{error}->{code} . ': ' . $mediawiki->{error}->{details} . "\n";
+		}
 		foreach my $page (@{$mw_pages}) {
 			$pages->{$page->{title}} = $page;
 		}
@@ -284,14 +390,15 @@ sub get_mw_tracked_namespaces {
 		}
 		# virtual namespaces don't support allpages
 		next if !defined($namespace_id) || $namespace_id < 0;
-		my $mw_pages = $mediawiki->list( {
+		my $mw_pages = list_request_with_retry($mediawiki, {
 			action => 'query',
 			list => 'allpages',
 			apnamespace => $namespace_id,
-			aplimit => 'max' } )
-			|| die $mediawiki->{error}->{code} . ': '
-			. $mediawiki->{error}->{details} . "\n";
-		print {*STDERR} "$#{$mw_pages} found in namespace $local_namespace ($namespace_id)\n";
+			aplimit => 'max' }, "get namespace pages");
+		if (!defined($mw_pages)) {
+			die $mediawiki->{error}->{code} . ': ' . $mediawiki->{error}->{details} . "\n";
+		}
+		log_info("$#{$mw_pages} found in namespace $local_namespace ($namespace_id)\n");
 		foreach my $page (@{$mw_pages}) {
 			$pages->{$page->{title}} = $page;
 		}
@@ -302,16 +409,29 @@ sub get_mw_tracked_namespaces {
 sub get_mw_all_pages {
 	my $pages = shift;
 	# No user-provided list, get the list of pages from the API.
-	my $mw_pages = $mediawiki->list({
+	my $query = {
 		action => 'query',
 		list => 'allpages',
 		aplimit => 'max'
-	});
-	if (!defined($mw_pages)) {
-		fatal_mw_error("get the list of wiki pages");
-	}
-	foreach my $page (@{$mw_pages}) {
-		$pages->{$page->{title}} = $page;
+	};
+	my $curpage;
+	my $oldpage = '';
+	while (1) {
+		if (defined($curpage)) {
+			if ($oldpage eq $curpage) {
+			    last;
+			}
+			$query->{apfrom} = $curpage;
+			$oldpage = $curpage;
+		}
+		my $mw_pages = list_request_with_retry($mediawiki, $query, "get all pages");
+		if (!defined($mw_pages)) {
+			fatal_mw_error("get the list of wiki pages");
+		}
+		foreach my $page (@{$mw_pages}) {
+			$pages->{$page->{title}} = $page;
+			$curpage = $page->{title};
+		}
 	}
 	return;
 }
@@ -327,16 +447,16 @@ sub get_mw_first_pages {
 	# pattern 'page1|page2|...' required by the API
 	my $titles = join('|', @some_pages);
 
-	my $mw_pages = $mediawiki->api({
+	my $mw_pages = api_request_with_retry($mediawiki, {
 		action => 'query',
 		titles => $titles,
-	});
+	}, "query pages");
 	if (!defined($mw_pages)) {
 		fatal_mw_error("query the list of wiki pages");
 	}
 	while (my ($id, $page) = each(%{$mw_pages->{query}->{pages}})) {
 		if ($id < 0) {
-			print {*STDERR} "Warning: page $page->{title} not found on wiki\n";
+			log_warning("page $page->{title} not found on wiki\n");
 		} else {
 			$pages->{$page->{title}} = $page;
 		}
@@ -348,7 +468,7 @@ sub get_mw_first_pages {
 sub get_mw_pages {
 	$mediawiki = connect_maybe($mediawiki, $remotename, $url);
 
-	print {*STDERR} "Listing pages on remote wiki...\n";
+	log_info("Listing pages on remote wiki...\n");
 
 	my %pages; # hash on page titles to avoid duplicates
 	my $user_defined;
@@ -370,14 +490,14 @@ sub get_mw_pages {
 		get_mw_all_pages(\%pages);
 	}
 	if ($import_media) {
-		print {*STDERR} "Getting media files for selected pages...\n";
+		log_info("Getting media files for selected pages...\n");
 		if ($user_defined) {
 			get_linked_mediafiles(\%pages);
 		} else {
 			get_all_mediafiles(\%pages);
 		}
 	}
-	print {*STDERR} (scalar keys %pages) . " pages found.\n";
+	log_info((scalar keys %pages) . " pages found.\n");
 	return %pages;
 }
 
@@ -390,7 +510,7 @@ sub _run_git {
 	my $encoding = (shift || 'encoding(UTF-8)');
 	open(my $git, "-|:${encoding}", @$args)
 	    or die "Unable to fork: $!\n";
-	my $res = do {
+		my $res = do {
 		local $/ = undef;
 		<$git>
 	};
@@ -419,9 +539,9 @@ sub get_all_mediafiles {
 		aplimit => 'max'
 	});
 	if (!defined($mw_pages)) {
-		print {*STDERR} "fatal: could not get the list of pages for media files.\n";
-		print {*STDERR} "fatal: '$url' does not appear to be a mediawiki\n";
-		print {*STDERR} "fatal: make sure '$url/api.php' is a valid page.\n";
+		log_fatal("could not get the list of pages for media files.\n");
+		log_fatal("'$url' does not appear to be a mediawiki\n");
+		log_fatal("make sure '$url/api.php' is a valid page.\n");
 		exit 1;
 	}
 	foreach my $page (@{$mw_pages}) {
@@ -503,14 +623,14 @@ sub get_mw_mediafile_for_page_revision {
 		my $fileinfo = pop(@{$file->{imageinfo}});
 		# Mediawiki::API's download function doesn't support https URLs
 		# and can't download old versions of files.
-		print {*STDERR} "\tDownloading file $filename, version $fileinfo->{timestamp}\n";
+		log_info("\tDownloading file $filename, version $fileinfo->{timestamp}\n");
 		my $content = download_mw_mediafile($fileinfo->{url});
 		if (defined($content)) {
 			$mediafile{content} = $content;
 			$mediafile{title} = $filename;
 			$mediafile{timestamp} = $fileinfo->{timestamp};
 		} else {
-			print {*STDERR} "\tFAILED downloading $fileinfo->{url}! Skipping!\n";
+			log_warning("\tFAILED downloading $fileinfo->{url}! Skipping!\n");
 		}
 	}
 	return %mediafile;
@@ -534,28 +654,28 @@ sub download_mw_mediafile {
 		$download_url =~ s{.*?\Q$wiki_name\E/}{$url/};
 		return download_mw_mediafile($download_url);
 	} else {
-		print {*STDERR} "Error downloading mediafile from :\n";
-		print {*STDERR} "URL: ${download_url}\n";
-		print {*STDERR} 'Server response: ' . $response->code . q{ } . $response->message . "\n";
+		log_error("downloading mediafile from :\n");
+		log_error("URL: ${download_url}\n");
+		log_error('Server response: ' . $response->code . q{ } . $response->message . "\n");
 		return;
 	}
 }
 
 sub get_last_local_revision {
-	# Get note regarding last mediawiki revision.
+# Get note regarding last mediawiki revision.
 	my $note = run_git_quoted_nostderr(["notes", "--ref=${remotename}/mediawiki",
 					    "show", "refs/mediawiki/${remotename}/master"]);
 	my @note_info = split(/ /, $note);
 
 	my $lastrevision_number;
 	if (!(defined($note_info[0]) && $note_info[0] eq 'mediawiki_revision:')) {
-		print {*STDERR} 'No previous mediawiki revision found';
+		log_info('No previous mediawiki revision found');
 		$lastrevision_number = 0;
 	} else {
 		# Notes are formatted : mediawiki_revision: #number
 		$lastrevision_number = $note_info[1];
 		chomp($lastrevision_number);
-		print {*STDERR} "Last local mediawiki revision found is ${lastrevision_number}";
+		log_info("Last local mediawiki revision found is ${lastrevision_number}");
 	}
 	return $lastrevision_number;
 }
@@ -588,28 +708,81 @@ sub get_last_remote_revision {
 
 	my $max_rev_num = 0;
 
-	print {*STDERR} "Getting last revision id on tracked pages...\n";
-
-	foreach my $page (@pages) {
-		my $id = $page->{pageid};
+	log_info("Getting last revision id on tracked pages...\n");
+
+	if ($parallel_workers > 1 && scalar(@pages) > 1) {
+		log_info("Getting last revisions in parallel with ${parallel_workers} workers...\n");
+		
+		my $pm = Parallel::ForkManager->new($parallel_workers);
+		my %child_basetimestamps;
+		my $child_max_rev = 0;
+		
+		my $cookie_jar_str = serialize_cookie_jar($mediawiki);
+		
+		$pm->run_on_finish(sub {
+			my ($pid, $exit_code, $ident, $exit_signal, $core_dump, $data) = @_;
+			if (defined($data) && ref($data) eq 'HASH') {
+				if (defined($data->{basetimestamps}) && ref($data->{basetimestamps}) eq 'HASH') {
+					while (my ($revid, $timestamp) = each %{$data->{basetimestamps}}) {
+						$basetimestamps{$revid} = $timestamp;
+					}
+				}
+				if (defined($data->{max_rev}) && $data->{max_rev} > $max_rev_num) {
+					$max_rev_num = $data->{max_rev};
+				}
+			}
+		});
+		
+		foreach my $page (@pages) {
+			$pm->start($page->{title}) and next;
+			
+			my $wiki = connect_maybe(undef, $remotename, $url, $cookie_jar_str);
+			my $id = $page->{pageid};
+			my %local_basetimestamps;
+			my $local_max_rev = 0;
+
+			my $query = {
+				action => 'query',
+				prop => 'revisions',
+				rvprop => 'ids|timestamp',
+				pageids => $id,
+			};
+
+			my $result = $wiki->api($query);
+
+			if (defined($result) && defined($result->{query}->{pages}->{$id}->{revisions})) {
+				my $lastrev = pop(@{$result->{query}->{pages}->{$id}->{revisions}});
+				if (defined($lastrev)) {
+					$local_basetimestamps{$lastrev->{revid}} = $lastrev->{timestamp};
+					$local_max_rev = $lastrev->{revid};
+				}
+			}
+			
+			$pm->finish(0, { basetimestamps => \%local_basetimestamps, max_rev => $local_max_rev });
+		}
+		$pm->wait_all_children;
+	} else {
+		foreach my $page (@pages) {
+			my $id = $page->{pageid};
 
-		my $query = {
-			action => 'query',
-			prop => 'revisions',
-			rvprop => 'ids|timestamp',
-			pageids => $id,
-		};
+			my $query = {
+				action => 'query',
+				prop => 'revisions',
+				rvprop => 'ids|timestamp',
+				pageids => $id,
+			};
 
-		my $result = $mediawiki->api($query);
+			my $result = $mediawiki->api($query);
 
-		my $lastrev = pop(@{$result->{query}->{pages}->{$id}->{revisions}});
+			my $lastrev = pop(@{$result->{query}->{pages}->{$id}->{revisions}});
 
-		$basetimestamps{$lastrev->{revid}} = $lastrev->{timestamp};
+			$basetimestamps{$lastrev->{revid}} = $lastrev->{timestamp};
 
-		$max_rev_num = ($lastrev->{revid} > $max_rev_num ? $lastrev->{revid} : $max_rev_num);
+			$max_rev_num = ($lastrev->{revid} > $max_rev_num ? $lastrev->{revid} : $max_rev_num);
+		}
 	}
 
-	print {*STDERR} "Last remote revision found is $max_rev_num.\n";
+	log_info("Last remote revision found is $max_rev_num.\n");
 	return $max_rev_num;
 }
 
@@ -679,7 +852,7 @@ sub mw_list {
 }
 
 sub mw_option {
-	print {*STDERR} "remote-helper command 'option $_[0]' not yet implemented\n";
+	log_warning("remote-helper command 'option $_[0]' not yet implemented\n");
 	print {*STDOUT} "unsupported\n";
 	return;
 }
@@ -688,7 +861,12 @@ sub fetch_mw_revisions_for_page {
 	my $page = shift;
 	my $id = shift;
 	my $fetch_from = shift;
+	my $is_parallel = shift || 0;
+	my $cookie_jar_str = shift;
 	my @page_revs = ();
+	
+	my $wiki = connect_maybe(undef, $remotename, $url, $cookie_jar_str);
+
 	my $query = {
 		action => 'query',
 		prop => 'revisions',
@@ -709,7 +887,7 @@ sub fetch_mw_revisions_for_page {
 	my $revnum = 0;
 	# Get 500 revisions at a time due to the mediawiki api limit
 	while (1) {
-		my $result = $mediawiki->api($query);
+		my $result = $wiki->api($query);
 
 		# Parse each of those 500 revisions
 		foreach my $revision (@{$result->{query}->{pages}->{$id}->{revisions}}) {
@@ -730,11 +908,15 @@ sub fetch_mw_revisions_for_page {
 		}
 	}
 	if ($shallow_import && @page_revs) {
-		print {*STDERR} "  Found 1 revision (shallow import).\n";
+		log_info("  Found 1 revision (shallow import).\n");
 		@page_revs = sort {$b->{revid} <=> $a->{revid}} (@page_revs);
 		return $page_revs[0];
 	}
-	print {*STDERR} "  Found ${revnum} revision(s).\n";
+	
+	if (!$is_parallel && $revnum > 0) {
+		log_info("  Found ${revnum} revision(s).\n");
+	}
+	
 	return @page_revs;
 }
 
@@ -743,16 +925,47 @@ sub fetch_mw_revisions {
 	my $fetch_from = shift;
 
 	my @revisions = ();
-	my $n = 1;
-	foreach my $page (@pages) {
-		my $id = $page->{pageid};
-		print {*STDERR} "page ${n}/", scalar(@pages), ': ', $page->{title}, "\n";
-		$n++;
-		my @page_revs = fetch_mw_revisions_for_page($page, $id, $fetch_from);
-		@revisions = (@page_revs, @revisions);
+	my $total_pages = scalar(@pages);
+	my $processed_pages = 0;
+	
+	if ($parallel_workers > 1 && $total_pages > 1) {
+		log_info("Fetching revisions in parallel with ${parallel_workers} workers...\n");
+		
+		my $pm = Parallel::ForkManager->new($parallel_workers);
+		my $cookie_jar_str = serialize_cookie_jar($mediawiki);
+		
+		$pm->run_on_finish(sub {
+			my ($pid, $exit_code, $ident, $exit_signal, $core_dump, $data) = @_;
+			if (defined($data) && ref($data) eq 'ARRAY') {
+				push @revisions, @{$data};
+			}
+		});
+		
+		my $page_counter = 0;
+		foreach my $page (@pages) {
+			my $current_page_num = ++$page_counter;
+			$pm->start($page->{title}) and next;
+			
+			my $id = $page->{pageid};
+			log_info("${current_page_num}/${total_pages}: ", $page->{title}, "\n");
+			
+			my @page_revs = fetch_mw_revisions_for_page($page, $id, $fetch_from, 1, $cookie_jar_str);
+			
+			$pm->finish(0, \@page_revs);
+		}
+		$pm->wait_all_children;
+		$processed_pages = $total_pages;
+	} else {
+		foreach my $page (@pages) {
+			$processed_pages++;
+			my $id = $page->{pageid};
+			log_info("${processed_pages}/${total_pages}: ", $page->{title}, "\n");
+			my @page_revs = fetch_mw_revisions_for_page($page, $id, $fetch_from);
+			@revisions = (@page_revs, @revisions);
+		}
 	}
 
-	return ($n, @revisions);
+	return ($processed_pages, @revisions);
 }
 
 sub fe_escape_path {
@@ -780,6 +993,8 @@ sub import_file_revision {
 	my $author = $commit{author};
 	my $date = $commit{date};
 
+	$author =~ s/(.*[<>])//g;
+
 	print {*STDOUT} "commit refs/mediawiki/${remotename}/master\n";
 	print {*STDOUT} "mark :${n}\n";
 	print {*STDOUT} "committer ${author} <${author}\@${wiki_name}> " . $date->epoch . " +0000\n";
@@ -866,30 +1081,30 @@ sub mw_import_ref {
 
 	$mediawiki = connect_maybe($mediawiki, $remotename, $url);
 
-	print {*STDERR} "Searching revisions...\n";
+	log_info("Searching revisions...\n");
 	my $last_local = get_last_local_revision();
 	my $fetch_from = $last_local + 1;
 	if ($fetch_from == 1) {
-		print {*STDERR} ", fetching from beginning.\n";
+		log_info(", fetching from beginning.\n");
 	} else {
-		print {*STDERR} ", fetching from here.\n";
+		log_info(", fetching from here.\n");
 	}
 
 	my $n = 0;
 	if ($fetch_strategy eq 'by_rev') {
-		print {*STDERR} "Fetching & writing export data by revs...\n";
+		log_info("Fetching & writing export data by revs...\n");
 		$n = mw_import_ref_by_revs($fetch_from);
 	} elsif ($fetch_strategy eq 'by_page') {
-		print {*STDERR} "Fetching & writing export data by pages...\n";
+		log_info("Fetching & writing export data by pages...\n");
 		$n = mw_import_ref_by_pages($fetch_from);
 	} else {
-		print {*STDERR} qq(fatal: invalid fetch strategy "${fetch_strategy}".\n);
-		print {*STDERR} "Check your configuration variables remote.${remotename}.fetchStrategy and mediawiki.fetchStrategy\n";
+		log_fatal(qq(invalid fetch strategy "${fetch_strategy}".\n));
+		log_error("Check your configuration variables remote.${remotename}.fetchStrategy and mediawiki.fetchStrategy\n");
 		exit 1;
 	}
 
 	if ($fetch_from == 1 && $n == 0) {
-		print {*STDERR} "You appear to have cloned an empty MediaWiki.\n";
+		log_info("You appear to have cloned an empty MediaWiki.\n");
 		# Something has to be done remote-helper side. If nothing is done, an error is
 		# thrown saying that HEAD is referring to unknown object 0000000000000000000
 		# and the clone fails.
@@ -952,7 +1167,8 @@ sub mw_import_revids {
 		my $result = $mediawiki->api($query);
 
 		if (!$result) {
-			die "Failed to retrieve modified page for revision(s) $revs\n";
+			log_warning("Failed to retrieve modified page for revision(s) $revs. Skipping...\n");
+			next;
 		}
 
 		my @result_pages = values(%{$result->{query}->{pages}});
@@ -971,15 +1187,15 @@ sub handle_result_page {
 
 	for my $rev (@{$result_page->{revisions}}) {
 		if (!exists($pages->{$page_title})) {
-			print {*STDERR} "${n}/", scalar(@{$revision_ids}),
-				": Skipping revision #$rev->{revid} of ${page_title}\n";
+			log_info("${n}/", scalar(@{$revision_ids}),
+				": Skipping revision #$rev->{revid} of ${page_title}\n");
 			next;
 		}
 
 		$n_actual++;
 
 		my %commit;
-		$commit{author} = $rev->{user} || 'Anonymous';
+		$commit{author} = escape_author($rev->{user}) || 'Anonymous';
 		$commit{comment} = $rev->{comment} || EMPTY_MESSAGE;
 		$commit{title} = smudge_filename($page_title);
 		$commit{mw_revision} = $rev->{revid};
@@ -1010,7 +1226,7 @@ sub handle_result_page {
 		# If this is a revision of the media page for new version
 		# of a file do one common commit for both file and media page.
 		# Else do commit only for that page.
-		print {*STDERR} "${n}/", scalar(@{$revision_ids}), ": Revision #$rev->{revid} of $commit{title}\n";
+		log_info("${n}/", scalar(@{$revision_ids}), ": Revision #$rev->{revid} of $commit{title}\n");
 		import_file_revision(\%commit, ($fetch_from == 1), $n_actual, \%mediafile);
 	}
 
@@ -1024,9 +1240,9 @@ sub error_non_fast_forward {
 		# Native git-push would show this after the summary.
 		# We can't ask it to display it cleanly, so print it
 		# ourselves before.
-		print {*STDERR} "To prevent you from losing history, non-fast-forward updates were rejected\n";
-		print {*STDERR} "Merge the remote changes (e.g. 'git pull') before pushing again. See the\n";
-		print {*STDERR} "'Note about fast-forwards' section of 'git push --help' for details.\n";
+		log_warning("To prevent you from losing history, non-fast-forward updates were rejected\n");
+		log_warning("Merge the remote changes (e.g. 'git pull') before pushing again. See the\n");
+		log_warning("'Note about fast-forwards' section of 'git push --help' for details.\n");
 	}
 	print {*STDOUT} qq(error $_[0] "non-fast-forward"\n);
 	return 0;
@@ -1042,8 +1258,8 @@ sub mw_upload_file {
 	my $path = "File:${complete_file_name}";
 	my %hashFiles = get_allowed_file_extensions();
 	if (!exists($hashFiles{$extension})) {
-		print {*STDERR} "${complete_file_name} is not a permitted file on this wiki.\n";
-		print {*STDERR} "Check the configuration of file uploads in your mediawiki.\n";
+		log_warning("${complete_file_name} is not a permitted file on this wiki.\n");
+		log_warning("Check the configuration of file uploads in your mediawiki.\n");
 		return $newrevid;
 	}
 	# Deleting and uploading a file requires a privileged user
@@ -1055,14 +1271,14 @@ sub mw_upload_file {
 			reason => $summary
 		};
 		if (!$mediawiki->edit($query)) {
-			print {*STDERR} "Failed to delete file on remote wiki\n";
-			print {*STDERR} "Check your permissions on the remote site. Error code:\n";
-			print {*STDERR} $mediawiki->{error}->{code} . ':' . $mediawiki->{error}->{details};
+			log_error("Failed to delete file on remote wiki\n");
+			log_error("Check your permissions on the remote site. Error code:\n");
+			log_error($mediawiki->{error}->{code} . ':' . $mediawiki->{error}->{details});
 			exit 1;
 		}
 	} else {
 		# Don't let perl try to interpret file content as UTF-8 => use "raw"
-		my $content = run_git_quoted(["cat-file", "blob", $new_sha1], 'raw');
+		my $content = run_git_quoted(["cat-file", "blob", "${new_sha1}"], 'raw');
 		if ($content ne EMPTY) {
 			$mediawiki = connect_maybe($mediawiki, $remotename, $url);
 			$mediawiki->{config}->{upload_url} =
@@ -1081,9 +1297,9 @@ sub mw_upload_file {
 				 . $mediawiki->{error}->{details} . "\n";
 			my $last_file_page = $mediawiki->get_page({title => $path});
 			$newrevid = $last_file_page->{revid};
-			print {*STDERR} "Pushed file: ${new_sha1} - ${complete_file_name}.\n";
+			log_info("Pushed file: ${new_sha1} - ${complete_file_name}.\n");
 		} else {
-			print {*STDERR} "Empty file ${complete_file_name} not pushed.\n";
+			log_info("Empty file ${complete_file_name} not pushed.\n");
 		}
 	}
 	return $newrevid;
@@ -1121,7 +1337,7 @@ sub mw_push_file {
 	if ($extension eq 'mw') {
 		my $ns = get_mw_namespace_id_for_page($complete_file_name);
 		if ($ns && $ns == get_mw_namespace_id('File') && (!$export_media)) {
-			print {*STDERR} "Ignoring media file related page: ${complete_file_name}\n";
+			log_info("Ignoring media file related page: ${complete_file_name}\n");
 			return ($oldrevid, 'ok');
 		}
 		my $file_content;
@@ -1132,7 +1348,7 @@ sub mw_push_file {
 			# with this content instead:
 			$file_content = DELETED_CONTENT;
 		} else {
-			$file_content = run_git_quoted(["cat-file", "blob", $new_sha1]);
+			$file_content = run_git_quoted(["cat-file", "blob", "${new_sha1}"]);
 		}
 
 		$mediawiki = connect_maybe($mediawiki, $remotename, $url);
@@ -1149,10 +1365,10 @@ sub mw_push_file {
 		if (!$result) {
 			if ($mediawiki->{error}->{code} == 3) {
 				# edit conflicts, considered as non-fast-forward
-				print {*STDERR} 'Warning: Error ' .
+				log_warning('Error ' .
 					$mediawiki->{error}->{code} .
 					' from mediawiki: ' . $mediawiki->{error}->{details} .
-					".\n";
+					".\n");
 				return ($oldrevid, 'non-fast-forward');
 			} else {
 				# Other errors. Shouldn't happen => just die()
@@ -1162,13 +1378,13 @@ sub mw_push_file {
 			}
 		}
 		$newrevid = $result->{edit}->{newrevid};
-		print {*STDERR} "Pushed file: ${new_sha1} - ${title}\n";
+		log_info("Pushed file: ${new_sha1} - ${title}\n");
 	} elsif ($export_media) {
 		$newrevid = mw_upload_file($complete_file_name, $new_sha1,
 															 $extension, $page_deleted,
 															 $summary);
 	} else {
-		print {*STDERR} "Ignoring media file ${title}\n";
+		log_info("Ignoring media file ${title}\n");
 	}
 	$newrevid = ($newrevid or $oldrevid);
 	return ($newrevid, 'ok');
@@ -1182,15 +1398,15 @@ sub mw_push {
 		my ($force, $local, $remote) = $refspec =~ /^(\+)?([^:]*):([^:]*)$/
 			or die("Invalid refspec for push. Expected <src>:<dst> or +<src>:<dst>\n");
 		if ($force) {
-			print {*STDERR} "Warning: forced push not allowed on a MediaWiki.\n";
+			log_warning("forced push not allowed on a MediaWiki.\n");
 		}
 		if ($local eq EMPTY) {
-			print {*STDERR} "Cannot delete remote branch on a MediaWiki\n";
+			log_error("Cannot delete remote branch on a MediaWiki\n");
 			print {*STDOUT} "error ${remote} cannot delete\n";
 			next;
 		}
 		if ($remote ne 'refs/heads/master') {
-			print {*STDERR} "Only push to the branch 'master' is supported on a MediaWiki\n";
+			log_error("Only push to the branch 'master' is supported on a MediaWiki\n");
 			print {*STDOUT} "error ${remote} only master allowed\n";
 			next;
 		}
@@ -1203,12 +1419,12 @@ sub mw_push {
 	print {*STDOUT} "\n";
 
 	if ($pushed && $dumb_push) {
-		print {*STDERR} "Just pushed some revisions to MediaWiki.\n";
-		print {*STDERR} "The pushed revisions now have to be re-imported, and your current branch\n";
-		print {*STDERR} "needs to be updated with these re-imported commits. You can do this with\n";
-		print {*STDERR} "\n";
-		print {*STDERR} "  git pull --rebase\n";
-		print {*STDERR} "\n";
+		log_info("Just pushed some revisions to MediaWiki.\n");
+		log_info("The pushed revisions now have to be re-imported, and your current branch\n");
+		log_info("needs to be updated with these re-imported commits. You can do this with\n");
+		log_info("\n");
+		log_info("  git pull --rebase\n");
+		log_info("\n");
 	}
 	return;
 }
@@ -1217,7 +1433,7 @@ sub mw_push_revision {
 	my $local = shift;
 	my $remote = shift;						# actually, this has to be "refs/heads/master" at this point.
 	my $last_local_revid = get_last_local_revision();
-	print {*STDERR} ".\n";				# Finish sentence started by get_last_local_revision()
+	log_info(".");				# Finish sentence started by get_last_local_revision()
 	my $last_remote_revid = get_last_remote_revision();
 	my $mw_revision = $last_remote_revid;
 
@@ -1243,8 +1459,8 @@ sub mw_push_revision {
 	if ($last_local_revid > 0) {
 		my $parsed_sha1 = $remoteorigin_sha1;
 		# Find a path from last MediaWiki commit to pushed commit
-		print {*STDERR} "Computing path from local to remote ...\n";
-		my @local_ancestry = split(/\n/, run_git_quoted(["rev-list", "--boundary", "--parents", $local, "^${parsed_sha1}"]));
+		log_info("Computing path from local to remote ...\n");
+		my @local_ancestry = split(/\n/, run_git_quoted(["rev-list", "--boundary", "--parents", "${local}", "^${parsed_sha1}"]));
 		my %local_ancestry;
 		foreach my $line (@local_ancestry) {
 			if (my ($child, $parents) = $line =~ /^-?([a-f0-9]+) ([a-f0-9 ]+)/) {
@@ -1258,7 +1474,7 @@ sub mw_push_revision {
 		while ($parsed_sha1 ne $HEAD_sha1) {
 			my $child = $local_ancestry{$parsed_sha1};
 			if (!$child) {
-				print {*STDERR} "Cannot find a path in history from remote commit to last commit\n";
+				log_error("Cannot find a path in history from remote commit to last commit\n");
 				return error_non_fast_forward($remote);
 			}
 			push(@commit_pairs, [$parsed_sha1, $child]);
@@ -1267,8 +1483,8 @@ sub mw_push_revision {
 	} else {
 		# No remote mediawiki revision. Export the whole
 		# history (linearized with --first-parent)
-		print {*STDERR} "Warning: no common ancestor, pushing complete history\n";
-		my $history = run_git_quoted(["rev-list", "--first-parent", "--children", $local]);
+		log_warning("no common ancestor, pushing complete history\n");
+		my $history = run_git_quoted(["rev-list", "--first-parent", "--children", "${local}"]);
 		my @history = split(/\n/, $history);
 		@history = @history[1..$#history];
 		foreach my $line (reverse @history) {
@@ -1280,12 +1496,12 @@ sub mw_push_revision {
 	foreach my $commit_info_split (@commit_pairs) {
 		my $sha1_child = @{$commit_info_split}[0];
 		my $sha1_commit = @{$commit_info_split}[1];
-		my $diff_infos = run_git_quoted(["diff-tree", "-r", "--raw", "-z", $sha1_child, $sha1_commit]);
+		my $diff_infos = run_git_quoted(["diff-tree", "-r", "--raw", "-z", "${sha1_child}", "${sha1_commit}"]);
 		# TODO: we could detect rename, and encode them with a #redirect on the wiki.
 		# TODO: for now, it's just a delete+add
 		my @diff_info_list = split(/\0/, $diff_infos);
 		# Keep the subject line of the commit message as mediawiki comment for the revision
-		my $commit_msg = run_git_quoted(["log", "--no-walk", '--format="%s"', $sha1_commit]);
+		my $commit_msg = run_git_quoted(["log", "--no-walk", "--format=%s", "${sha1_commit}"]);
 		chomp($commit_msg);
 		# Push every blob
 		while (@diff_info_list) {
@@ -1368,7 +1584,7 @@ sub get_mw_namespace_id {
 	}
 
 	if (!exists $namespace_id{$name}) {
-		print {*STDERR} "Namespace ${name} not found in cache, querying the wiki ...\n";
+		log_info("Namespace ${name} not found in cache, querying the wiki ...\n");
 		# NS not found => get namespace id from MW and store it in
 		# configuration file.
 		my $query = {
@@ -1398,7 +1614,7 @@ sub get_mw_namespace_id {
 			s/ /_/g;
 			push @namespaces, $_;
 		}
-		print {*STDERR} "No such namespace ${name} on MediaWiki, known namespaces: @namespaces\n";
+		log_error("No such namespace ${name} on MediaWiki, known namespaces: @namespaces\n");
 		$ns = {is_namespace => 0};
 		$namespace_id{$name} = $ns;
 	}
@@ -1426,4 +1642,4 @@ sub get_mw_namespace_id_for_page {
 	} else {
 		return;
 	}
-}
+}
\ No newline at end of file
