class CharsetNormalizer < Formula
  include Language::Python::Virtualenv

  desc "Open, modern and actively maintained alternative to Chardet"
  homepage "https://github.com/jawah/charset_normalizer/"
  url "https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24/charset_normalizer-3.4.5.tar.gz"
  sha256 "95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644"
  license "MIT"
  head "https://github.com/jawah/charset_normalizer", branch: "master"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/normalizer -h")
    assert_match "usage", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/normalizer --version")
    assert_match "Charset-Normalizer #{version}", version_output
  end
end
