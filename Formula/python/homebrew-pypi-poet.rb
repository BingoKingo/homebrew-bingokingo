class HomebrewPypiPoet < Formula
  include Language::Python::Virtualenv

  desc "Generates Homebrew resource stanzas for Python packages"
  homepage "https://github.com/tdsmith/homebrew-pypi-poet/"
  url "https://files.pythonhosted.org/packages/f7/d9/4b525af3be6ac0a0a962e101b7771db6511d9e96369ded2765406233f9ff/homebrew-pypi-poet-0.10.0.tar.gz"
  sha256 "e09e997e35a98f66445f9a39ccb33d6d93c5cd090302a59f231707eac0bf378e"
  license "MIT"
  head "https://github.com/tdsmith/homebrew-pypi-poet.git", branch: "master"
  deprecate! date: "2018-02-23", because: :unmaintained
  depends_on "python-setuptools" => :build
  depends_on "python@3.14"

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7/markupsafe-3.0.3.tar.gz"
    sha256 "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/76/95/faf61eb8363f26aa7e1d762267a8d602a1b26d4f3a1e758e92cb3cb8b054/setuptools-80.10.2.tar.gz"
    sha256 "8b0e9d10c784bf7d262c4e5ec5d4ec94127ce206e8738f29a437945fbc219b70"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/poet -h")
    assert_match "usage", output
    assert_match "options", output
    version_output = shell_output("#{bin}/poet -V")
    assert_match "homebrew-pypi-poet #{version}", version_output
  end
end
