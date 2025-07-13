class NginxConfigFormatter < Formula
  include Language::Python::Virtualenv
  desc "Nginx config file formatter/beautifier"
  homepage "https://github.com/slomkowski/nginx-config-formatter/"
  url "https://files.pythonhosted.org/packages/d2/38/190657c9ee2aee9d164ba1e06e72204b37b8325ade4640e3bb8753465c46/nginxfmt-1.3.0.tar.gz"
  sha256 "384d09b0d812c20d1b0112b580173b57b4e4266e6dbb9a53f9be6d613f4bd637"
  license "Apache-2.0"
  head "https://github.com/slomkowski/nginx-config-formatter.git", branch: "master"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"nginxfmt", "-h"
  end
end
