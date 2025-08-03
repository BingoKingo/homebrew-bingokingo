# [F] Fork project, modified from https://github.com/gromgit/homebrew-fuse/blob/HEAD/Formula/gitfs-mac.rb
class GitfsKovan < Formula
  include Language::Python::Virtualenv
  desc "Version controlled fuse filesystem (require macfuse)"
  homepage "https://github.com/kovan/gitfs/"
  license "Apache-2.0"
  head "https://github.com/kovan/gitfs.git", branch: "master"

  depends_on "cffi"
  depends_on "ipython"
  depends_on "libgit2"
  depends_on :macos
  depends_on "pycparser"
  depends_on "pygit2"
  depends_on "python@3.13"
  uses_from_macos "libffi"

  resource "atomiclong" do
    url "https://files.pythonhosted.org/packages/86/8c/70aea8215c6ab990f2d91e7ec171787a41b7fbc83df32a067ba5d7f3324f/atomiclong-0.1.1.tar.gz"
    sha256 "cb1378c4cd676d6f243641c50e277504abf45f70f1ea76e446efcdbb69624bbe"
  end

  resource "cached-property" do
    url "https://files.pythonhosted.org/packages/57/8e/0698e10350a57d46b3bcfe8eff1d4181642fd1724073336079cb13c5cf7f/cached-property-1.5.1.tar.gz"
    sha256 "9217a59f14a5682da7c4b8829deadbfc194ac22e9908ccf7c8820234e80a1504"
  end

  resource "fusepy" do
    url "https://files.pythonhosted.org/packages/04/0b/4506cb2e831cea4b0214d3625430e921faaa05a7fb520458c75a2dbd2152/fusepy-3.0.1.tar.gz"
    sha256 "72ff783ec2f43de3ab394e3f7457605bf04c8cf288a2f4068b4cde141d4ee6bd"
  end

  resource "ipdb" do
    url "https://files.pythonhosted.org/packages/3d/1b/7e07e7b752017f7693a0f4d41c13e5ca29ce8cbcfdcc1fd6c4ad8c0a27a0/ipdb-0.13.13.tar.gz"
    sha256 "e3ac6018ef05126d442af680aad863006ec19d02290561ac88b8b1c0b0cfc726"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "raven" do
    url "https://files.pythonhosted.org/packages/79/57/b74a86d74f96b224a477316d418389af9738ba7a63c829477e7a86dd6f47/raven-6.10.0.tar.gz"
    sha256 "3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54"
  end

  patch :DATA

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      gitfs clones repos in /var/lib/gitfs. You can either create it with
      sudo mkdir -m 1777 /var/lib/gitfs or use another folder with the
      repo_path argument.
    EOS
  end

  test do
    xy = Language::Python.major_minor_version Formula["python@3.13"].opt_bin/"python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"

    (testpath/"test.py").write <<~EOS
      import gitfs
      import pygit2
      pygit2.init_repository('testing/.git', True)
    EOS

    system Formula["python@3.13"].opt_bin/"python3", "test.py"
    assert_path_exists testpath/"testing/.git/config"
    cd "testing" do
      system "git", "remote", "add", "homebrew", "https://github.com/Homebrew/homebrew-core.git"
      assert_match "homebrew", shell_output("git remote")
    end
  end
end
__END__
diff --git a/requirements.txt b/requirements.txt
index a808f18..3e31ac9 100644
--- a/requirements.txt
+++ b/requirements.txt
@@ -1,9 +1,9 @@
 fusepy==3.0.1
 raven==6.10.0
-ipdb==0.13.4
-ipython==7.16.3
+ipdb==0.13.13
+ipython==8.31.0
-six==1.16.0
+six==1.17.0
-pygit2==1.12.2
-pycparser==2.21
-cffi==1.15.1
+pygit2==1.16.0
+pycparser==2.22
+cffi==1.17.1
 atomiclong==0.1.1
