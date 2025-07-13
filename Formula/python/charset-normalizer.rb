class CharsetNormalizer < Formula
  include Language::Python::Virtualenv
  desc "Open, modern and actively maintained alternative to Chardet"
  homepage "https://github.com/jawah/charset_normalizer/"
  url "https://files.pythonhosted.org/packages/e4/33/89c2ced2b67d1c2a61c19c6751aa8902d46ce3dacb23600a283619f5a12d/charset_normalizer-3.4.2.tar.gz"
  sha256 "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"
  license "MIT"
  head "https://github.com/jawah/charset_normalizer", branch: "master"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"normalizer", "-h"
  end
end
