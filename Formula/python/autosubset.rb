class Autosubset < Formula
  include Language::Python::Virtualenv
  desc "Automatic font subsetting for a provided text"
  homepage "https://gitlab.com/MarcelWaldvogel/autosubset/"
  url "https://files.pythonhosted.org/packages/53/63/f5b0c28cafd695b3006cc82e7b46067e516a13893f32d278cf94b9f38b9d/autosubset-0.2.2.tar.gz"
  sha256 "c90397098918550daabdc99f4463cb714325e494fc061eaf518441b616d58422"
  license "MIT"
  head "https://gitlab.com/MarcelWaldvogel/autosubset.git", branch: "main"

  depends_on "brotli"
  depends_on "python@3.13"

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/49/2e/0b11e907b90665253dbad425479e874e38a9e81ced397a4e3312b9116935/fonttools-4.55.6.tar.gz"
    sha256 "1beb4647a0df5ceaea48015656525eb8081af226fe96554089fd3b274d239ef0"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62/zopfli-0.2.3.post1.tar.gz"
    sha256 "96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"autosubset", "-h"
  end
end
