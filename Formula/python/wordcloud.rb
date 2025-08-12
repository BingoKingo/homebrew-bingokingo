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
  depends_on "fonttools"
  depends_on "numpy"
  depends_on "pillow"
  depends_on "python-packaging"
  depends_on "python@3.13"
  depends_on "six"

  resource "contourpy" do
    url "https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a/contourpy-1.3.3.tar.gz"
    sha256 "083e12155b210502d0bca491432bb04d56dc3432f95a979b429f2848c3dbe880"
  end

  resource "cycler" do
    url "https://files.pythonhosted.org/packages/a9/95/a3dbbb5028f35eafb79008e7522a75244477d2838f38cbb722248dabc2a8/cycler-0.12.1.tar.gz"
    sha256 "88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/5c/3c/85844f1b0feb11ee581ac23fe5fce65cd049a200c1446708cc1b7f922875/kiwisolver-1.4.9.tar.gz"
    sha256 "c3b22c26c6fd6811b0ae8363b95ca8ce4ea3c202d3d0975b2914310ceb1bcc4d"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/43/91/f2939bb60b7ebf12478b030e0d7f340247390f402b3b189616aad790c366/matplotlib-3.10.5.tar.gz"
    sha256 "352ed6ccfb7998a00881692f38b4ca083c691d3e275b4145423704c34c909076"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/37/7d/3fec4199c5ffb892bed55cff901e4f39a58c81df9c44c280499e92cad264/numpy-2.3.2.tar.gz"
    sha256 "e0486a11ec30cdecb53f184d496d1c6a20786c81e55e41640270130056f8ee48"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/packaging-25.0.tar.gz"
    sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
  end

  resource "pybind11" do
    url "https://files.pythonhosted.org/packages/d2/c1/72b9622fcb32ff98b054f724e213c7f70d6898baa714f4516288456ceaba/pybind11-2.13.6.tar.gz"
    sha256 "ba6af10348c12b24e92fa086b39cfba0eff619b61ac77c406167d813b096d39a"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238/pillow-11.3.0.tar.gz"
    sha256 "3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/bb/22/f1129e69d94ffff626bdb5c835506b3a5b4f3d070f17ea295e12c2c6f60f/pyparsing-3.2.3.tar.gz"
    sha256 "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink "wordcloud_cli" => "wordcloud"
  end

  test do
    system bin/"wordcloud_cli", "--help"
  end
end
