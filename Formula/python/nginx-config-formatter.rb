class NginxConfigFormatter < Formula
  include Language::Python::Virtualenv

  desc "Nginx config file formatter/beautifier"
  homepage "https://github.com/slomkowski/nginx-config-formatter/"
  url "https://files.pythonhosted.org/packages/d2/38/190657c9ee2aee9d164ba1e06e72204b37b8325ade4640e3bb8753465c46/nginxfmt-1.3.0.tar.gz"
  sha256 "384d09b0d812c20d1b0112b580173b57b4e4266e6dbb9a53f9be6d613f4bd637"
  license "Apache-2.0"
  head "https://github.com/slomkowski/nginx-config-formatter.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "02ed915a2faf018dd021b28eedf8204668a7a8000663826ecf832822b0e6a95c"
  end

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/nginxfmt -h 2>&1")
    assert_match "usage", output
    assert_match "Formats nginx configuration files in consistent way.", output
    assert_match "positional arguments", output
    assert_match "options", output
  end
end
