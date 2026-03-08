class OdesliCli < Formula
  include Language::Python::Virtualenv

  desc "CLI client for the Odesli/Songlink API"
  homepage "https://github.com/fabian-thomas/odesli-cli/"
  url "https://files.pythonhosted.org/packages/fe/b8/392fb7c6775d4f49a44319d50502d98c77bc44961e505fcb8d3829d0eab4/odesli-cli-0.0.3.tar.gz"
  sha256 "90aa761f82eb8eb0226c7193d56413902c8290d508ab46355a57e0d6cc77631c"
  license "MIT"
  head "https://github.com/fabian-thomas/odesli-cli.git", branch: "master"

  depends_on "certifi"
  depends_on "python@3.13"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd/certifi-2026.2.25.tar.gz"
    sha256 "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24/charset_normalizer-3.4.5.tar.gz"
    sha256 "95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "odesli" do
    url "https://files.pythonhosted.org/packages/39/70/801352d05764331d75bd9fca7a5c6f6c9be58530d82166587005131307b3/odesli-0.0.2.tar.gz"
    sha256 "4bfdf3c8bc00d5d4e735f4b8c553adf0be3734326dff9835b9cee06ec571bc34"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"odesli-cli", "-h"
  end
end
