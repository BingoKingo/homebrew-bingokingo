class CharsetNormalizer < Formula
  include Language::Python::Virtualenv
  desc "Open, modern and actively maintained alternative to Chardet"
  homepage "https://github.com/jawah/charset_normalizer/"
  url "https://files.pythonhosted.org/packages/83/2d/5fd176ceb9b2fc619e63405525573493ca23441330fcdaee6bef9460e924/charset_normalizer-3.4.3.tar.gz"
  sha256 "6fce4b8500244f6fcb71465d4a4930d132ba9ab8e71a7859e6a5d59851068d14"
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
