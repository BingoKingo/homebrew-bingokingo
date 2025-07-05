class CharsetNormalizer < Formula
  include Language::Python::Virtualenv
  desc "Open, modern and actively maintained alternative to Chardet"
  homepage "https://github.com/jawah/charset_normalizer/"
  url "https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357/charset_normalizer-3.4.1.tar.gz"
  sha256 "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
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
