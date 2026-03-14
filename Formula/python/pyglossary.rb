class Pyglossary < Formula
  include Language::Python::Virtualenv

  desc "Converting open source dictionary files aka glossaries"
  homepage "https://github.com/ilius/pyglossary/"
  url "https://files.pythonhosted.org/packages/ba/a4/507aa612aabf471e0a0394ca298ae2f8f3da253ccfc6de619bdc5c892c98/pyglossary-5.2.1.tar.gz"
  sha256 "895ffb0c579b2dcf4e20a51e18674c14b5970ad284d291527aa53f44392095ae"
  license "GPL-3.0-or-later"
  head "https://github.com/ilius/pyglossary.git", branch: "master"

  depends_on "icu4c" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk+3"
  depends_on "gtk4"
  depends_on "pygobject3"
  depends_on "python-tk@3.13"
  depends_on "python@3.13"
  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/b3/ca/824b1195773ce6166d388573fc106ce56d4a805bd7427b624e063596ec58/beautifulsoup4-4.12.3.tar.gz"
    sha256 "74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7781051"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/e7/6b/20c3a4b24751377aaa6307eb230b66701024012c29dd374999cc92983269/lxml-5.3.0.tar.gz"
    sha256 "4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/a1/e1/bd15cb8ffdcfeeb2bdc215de3c3cffca11408d829e4b8416dcfe71ba8854/prompt_toolkit-3.0.50.tar.gz"
    sha256 "544748f3860a2623ca5cd6d2795e7a14f3d0e1c3c9728359013f79877fc89bab"
  end

  resource "PyICU" do
    url "https://files.pythonhosted.org/packages/52/21/4e9b0a3ace3027fc63107fa2b5d6e66e321e104da071d787856962fbad52/PyICU-2.14.tar.gz"
    sha256 "acc7eb92bd5c554ed577249c6978450a4feda0aa6f01470152b3a7b382a02132"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/d7/ce/fbaeed4f9fb8b2daa961f90591662df6a86c1abf25c548329a86920aedfb/soupsieve-2.6.tar.gz"
    sha256 "e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pyglossary", "--help"
  end
end
