class Wordcloud < Formula
  include Language::Python::Virtualenv
  desc "Little word cloud generator"
  homepage "https://github.com/amueller/word_cloud/"
  url "https://files.pythonhosted.org/packages/03/a1/0530b9001b05dcd13de21c2d4d821db5365dade5180242179fbc39372c57/wordcloud-1.9.4.tar.gz"
  sha256 "b273d8a5ded97d3ead904046b49464dcb71119ee79df875072a4c105cadd347a"
  license "MIT"
  head "https://github.com/amueller/word_cloud.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "pillow"
  depends_on "python@3.13"
  depends_on "six"

  resource "contourpy" do
    url "https://files.pythonhosted.org/packages/66/54/eb9bfc647b19f2009dd5c7f5ec51c4e6ca831725f1aea7a993034f483147/contourpy-1.3.2.tar.gz"
    sha256 "b6945942715a034c671b7fc54f9588126b0b8bf23db2696e3ca8328f3ff0ab54"
  end

  resource "cycler" do
    url "https://files.pythonhosted.org/packages/a9/95/a3dbbb5028f35eafb79008e7522a75244477d2838f38cbb722248dabc2a8/cycler-0.12.1.tar.gz"
    sha256 "88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/52/97/5735503e58d3816b0989955ef9b2df07e4c99b246469bd8b3823a14095da/fonttools-4.58.5.tar.gz"
    sha256 "b2a35b0a19f1837284b3a23dd64fd7761b8911d50911ecd2bdbaf5b2d1b5df9c"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/82/59/7c91426a8ac292e1cdd53a63b6d9439abd573c875c3f92c146767dd33faf/kiwisolver-1.4.8.tar.gz"
    sha256 "23d5f023bdc8c7e54eb65f03ca5d5bb25b601eac4d7f1a042888a1f45237987e"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/26/91/d49359a21893183ed2a5b6c76bec40e0b1dcbf8ca148f864d134897cfc75/matplotlib-3.10.3.tar.gz"
    sha256 "2f82d2c5bb7ae93aaaa4cd42aca65d76ce6376f83304fa3a630b569aca274df0"
  end

  resource "meson-python" do
    url "https://files.pythonhosted.org/packages/67/66/91d242ea8dd1729addd36069318ba2cd03874872764f316c3bb51b633ed2/meson_python-0.17.1.tar.gz"
    sha256 "efb91f69f2e19eef7bc9a471ed2a4e730088cc6b39eacaf3e49fc4f930eb5f83"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/packaging-25.0.tar.gz"
    sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
  end

  resource "pybind11" do
    url "https://files.pythonhosted.org/packages/d2/c1/72b9622fcb32ff98b054f724e213c7f70d6898baa714f4516288456ceaba/pybind11-2.13.6.tar.gz"
    sha256 "ba6af10348c12b24e92fa086b39cfba0eff619b61ac77c406167d813b096d39a"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/bb/22/f1129e69d94ffff626bdb5c835506b3a5b4f3d070f17ea295e12c2c6f60f/pyparsing-3.2.3.tar.gz"
    sha256 "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink "wordcloud_cli" => "wordcloud"
  end

  test do
    system bin/"wordcloud_cli", "--help"
  end
end
