class NginxConfigFormatter < Formula
  include Language::Python::Virtualenv
  desc "Nginx config file formatter/beautifier"
  homepage "https://github.com/slomkowski/nginx-config-formatter/"
  url "https://files.pythonhosted.org/packages/e8/4e/afb3f89bc6f2a71ffa9b9b15d26b6ed0fc85f700172f177ab7e76eaccbe8/nginxfmt-1.2.3.tar.gz"
  sha256 "d7f13a6a6172a9267fe621a18102d014f099f2fe4702b0dc7a107f7d0cce0e0d"
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
