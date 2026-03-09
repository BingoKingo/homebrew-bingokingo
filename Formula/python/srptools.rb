class Srptools < Formula
  include Language::Python::Virtualenv

  desc "Tools to implement Secure Remote Password (SRP) authentication"
  homepage "https://github.com/idlesign/srptools/"
  url "https://files.pythonhosted.org/packages/a1/8a/d62af55a56d56216e96563bc9c29c2d16d957317742c2e5bd4e79a524b06/srptools-1.0.1.tar.gz"
  sha256 "7fa4337256a1542e8f5bb4bed19e1d9aea98fe5ff9baf76693342a1dd6ac7c96"
  license "BSD-3-Clause"
  head "https://github.com/idlesign/srptools.git", branch: "master"

  depends_on "python@3.14"
  depends_on "six"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/srptools --help")
    assert_match "Usage", output
    assert_match "srptools command line utility.", output
    assert_match "Tools to implement Secure Remote Password (SRP) authentication.", output
    assert_match "Basic scenario", output
    assert_match "Options", output
    assert_match "Commands", output
    version_output = shell_output("#{bin}/srptools --version")
    assert_match "srptools, version #{version}", version_output
  end
end
