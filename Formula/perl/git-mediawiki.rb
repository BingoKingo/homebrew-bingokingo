class GitMediawiki < Formula
  desc "Gate between Git and Mediawiki"
  homepage "https://github.com/alex-mashin/Git-Mediawiki/"
  license "GPL-2.0-or-later"
  head "https://github.com/alex-mashin/Git-Mediawiki.git", branch: "master"

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

    bin.install "git-remote-mediawiki"
    bin.install "git-mw"

    (libexec/"lib/Git").install "Git/Mediawiki.pm"
    bin.env_script_all_files(libexec/"bin", PERL5LIB: ENV.fetch("PERL5LIB", nil))
  end

  def caveats
    <<~EOS
      [F] Fork of
      https://github.com/Git-Mediawiki/Git-Mediawiki/
    EOS
  end

  test do
    assert_match "usage", shell_output("git-mw help")
  end
end
__END__
diff --git a/Git/Mediawiki.pm b/Git/Mediawiki.pm
index 5c29704..129c05f 100644
--- a/Git/Mediawiki.pm
+++ b/Git/Mediawiki.pm
@@ -20,7 +20,7 @@ BEGIN {
 	@ISA = qw(Exporter);
 
 	# Methods which can be called as standalone functions as well:
-	@EXPORT_OK = qw(clean_filename smudge_filename connect_maybe
+	@EXPORT_OK = qw(escape_author clean_filename smudge_filename connect_maybe
 									EMPTY HTTP_CODE_OK HTTP_CODE_PAGE_NOT_FOUND);
 }
 
@@ -34,6 +34,12 @@ use constant EMPTY => q{};
 use constant HTTP_CODE_OK => 200;
 use constant HTTP_CODE_PAGE_NOT_FOUND => 404;
 
+sub escape_author {
+    my $string = shift;
+    $string =~ s/([<>@])/uri_escape($1)/ge;
+    return $string;
+}
+
 sub clean_filename {
 	my $filename = shift;
 	$filename =~ s{@{[SLASH_REPLACEMENT]}}{/}g;
diff --git a/docs/User-manual.md b/docs/User-manual.md
index 699c82b..96d497a 100644
--- a/docs/User-manual.md
+++ b/docs/User-manual.md
@@ -2,25 +2,28 @@
 
 You need to have Git installed on your machine. See the [help with setup for Windows](http://help.github.com/win-set-up-git/), [Mac](http://help.github.com/mac-set-up-git/) or [Linux](http://help.github.com/linux-set-up-git/).
 
+*Note: The Git project does not contain the latest version available in the master of this repository. See https://github.com/Git-Mediawiki/Git-Mediawiki/issues/82 on the matter.*
+
 ### Dependencies
 
 You need to have the following Perl packages installed:
 
 * __MediaWiki::API__ (recent version. Version 0.39 works. Version 0.34 won't work with mediafiles)
 * __DateTime::Format::ISO8601__
+* __LWP::Protocol::https__ (for TLS access)
 
-On many distributions of Linux, these can be installed from packages `libmediawiki-api-perl` and `libdatetime-format-iso8601-perl`, respectively.
+#### ArchLinux
 
-For Gentoo-based Linux distributions they can be installed by emerging `dev-perl/MediaWiki-API` and `dev-perl/DateTime-Format-ISO8601`.
+On ArchLinux the packages are named `perl-mediawiki-api perl-datetime-format-iso8601 perl-lwp-protocol-https` and are optional dependencies of `git`.
 
-On OS X, they can be installed using the CPAN installation tool:
+#### Debian
 
-```shell
-sudo cpan MediaWiki::API
-sudo cpan DateTime::Format::ISO8601
-```
+On Debian-based systems __LWP::Protocol::https__ is available as `liblwp-protocol-https-perl` package.
+
+#### FreeBSD
 
 On FreeBSD, both dependencies are available from ports or packages:
+
 ```shell
 # Through packages
 pkg install p5-MediaWiki-API p5-DateTime-Format-ISO8601
@@ -32,11 +35,21 @@ cd /usr/ports/devel/p5-MediaWiki-API
 make install
 ```
 
-To access HTTPS wikis, you may also need
+#### Gentoo
 
-* __LWP::Protocol::https__
+For Gentoo-based Linux distributions, they can be installed by emerging `dev-perl/MediaWiki-API` and `dev-perl/DateTime-Format-ISO8601`.
+
+On OS X, they can be installed using the CPAN installation tool:
+
+```shell
+sudo cpan MediaWiki::API
+sudo cpan DateTime::Format::ISO8601
+```
+
+#### Linux in general
+
+On many Linux distributions these can be installed from packages `libmediawiki-api-perl`,  `libdatetime-format-iso8601-perl`, and `perl-lwp-protocol-https` respectively.
 
-On Linux, the package is called `perl-lwp-protocol-https`, or `liblwp-protocol-https-perl` on Debian-based systems.
 
 ### Git-Mediawiki
 
@@ -60,6 +73,8 @@ Alternatively, you may install Git-Mediawiki manually:
 Then, the first operation you should do is cloning the remote mediawiki. To do so, run the command
 
     git clone mediawiki::http://yourwikiadress.com
+		
+*Note: Only the main namespace is fetched this way! How to expand the clone to more namespaces, *
 
 You can commit your changes locally as usual with the command
 
@@ -77,36 +92,44 @@ It is strongly recommanded to run `git pull --rebase` after each `git push`.
 
 Knowing those commands, you can now edit your wiki with your favorite text editor!
 
-## Partial import of a Wiki
+## Modify import scope
+
 ### Limit the pages to be imported
 
 If you don't want to clone the whole wiki, you can import only some pages with:
 
     git clone -c remote.origin.pages='A_page Another_page' mediawiki::http://yourwikiadress.com
-
+		
 and/or select the content of MediaWiki Categories with:
 
     git clone -c remote.origin.categories='First Second' mediawiki::http://yourwikiadress.com
 
-By default, only the main namespace is inspected. But you can also specify other namespaces with the [following patchset](https://github.com/Git-Mediawiki/Git-Mediawiki/issues/10):
+### Changing processed namespaces
+
+To extend the import to more than the `(Main)` namespace, you can specify a list of the namespaces to process:
+
+    git clone -c remote.origin.namespaces='(Main) Talk Template Template_talk' mediawiki::http://yourwikiadress.com
+		
+*Note: Namespaces are addressed with their cannonical name, spaces in the name need to be replaced with underscores.*
 
-    git clone -c remote.origin.namespaces='(Main) Talk' mediawiki::http://yourwikiadress.com
+You can get  all cannonical namespaces of a wiki as a list from the API,  by sending this request:
+    api.php?action=query&meta=siteinfo&siprop=namespaces&formatversion=2
 
 ### Shallow imports
 
-It is also possible to import only the last revision of a wiki. This is done using the `remote.origin.shallow` configuration variable. To set it during a clone, use:
+It is also possible to import only the last revision of a wiki. This is done using the `remote.origin.shallow` configuration variable. To apply the variable once during the clone, use:
 
     git -c remote.origin.shallow=true clone mediawiki::http://example.com/wiki/
 
-Alternatively, you may let clone write the value to the `.git/config` file to have further `git fetch` import only the last revision of each page too with
+ You can set this variable permanently by using the `-c` option behind the clone command. This will write the value to git's repository config. Any consecutive pull or fetch will skip the intermediary versions, and only fetch the latest version of the pages.
 
     git clone -c remote.origin.shallow=true mediawiki::http://example.com/wiki/
 
-(i.e. `-c` option used after `clone` in the command)
 
 ## Authentication
 
-Some wiki require login/password. You can specify a login and password using the `remote.origin.mwLogin` and `remote.origin.mwPassword` configuration variables. If you need to do that at clone time, the best way is
+Some wiki require login/password. You can specify a login and password using the `remote.origin.mwLogin` and `remote.origin.mwPassword` configuration variables. You should not use your real password but create a `bot password` that has restricted rights. To create a bot password, visit `Special:Botpasswords` in your wiki.
+If you need the authentication at clone time, the best way is
 
     git init new-repo
     chmod 600 .git/config # you're going to put a password there
@@ -176,4 +199,4 @@ git config remote.origin.mediaimport true
 git pull
 ```
 
-The configuration will, of course, vary according to your original configuration.
\ No newline at end of file
+The configuration will, of course, vary according to your original configuration.
diff --git a/git-remote-mediawiki b/git-remote-mediawiki
index 9387653..d147269 100755
--- a/git-remote-mediawiki
+++ b/git-remote-mediawiki
@@ -17,7 +17,7 @@ use lib (split(/:/, $ENV{GITPERLLIB} || ""));
 
 use MediaWiki::API;
 use Git;
-use Git::Mediawiki qw(clean_filename smudge_filename connect_maybe EMPTY HTTP_CODE_OK);
+use Git::Mediawiki qw(escape_author clean_filename smudge_filename connect_maybe EMPTY HTTP_CODE_OK);
 use DateTime::Format::ISO8601;
 use warnings;
 
@@ -302,16 +302,29 @@ sub get_mw_tracked_namespaces {
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
+		my $mw_pages = $mediawiki->list($query);
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
@@ -770,6 +783,8 @@ sub import_file_revision {
 	my $author = $commit{author};
 	my $date = $commit{date};
 
+	$author =~ s/(.*[<>])//g;
+
 	print {*STDOUT} "commit refs/mediawiki/${remotename}/master\n";
 	print {*STDOUT} "mark :${n}\n";
 	print {*STDOUT} "committer ${author} <${author}\@${wiki_name}> " . $date->epoch . " +0000\n";
@@ -969,7 +984,7 @@ sub handle_result_page {
 		$n_actual++;
 
 		my %commit;
-		$commit{author} = $rev->{user} || 'Anonymous';
+		$commit{author} = escape_author($rev->{user}) || 'Anonymous';
 		$commit{comment} = $rev->{comment} || EMPTY_MESSAGE;
 		$commit{title} = smudge_filename($page_title);
 		$commit{mw_revision} = $rev->{revid};
