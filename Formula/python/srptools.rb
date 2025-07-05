class Srptools < Formula
  include Language::Python::Virtualenv
  desc "Tools to implement Secure Remote Password (SRP) authentication"
  homepage "https://github.com/idlesign/srptools/"
  url "https://files.pythonhosted.org/packages/a1/8a/d62af55a56d56216e96563bc9c29c2d16d957317742c2e5bd4e79a524b06/srptools-1.0.1.tar.gz"
  sha256 "7fa4337256a1542e8f5bb4bed19e1d9aea98fe5ff9baf76693342a1dd6ac7c96"
  license "BSD-3-Clause"
  head "https://github.com/idlesign/srptools.git", branch: "master"

  depends_on "python@3.13"

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"srptools", "--help"
  end
end
