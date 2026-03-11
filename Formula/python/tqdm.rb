class Tqdm < Formula
  include Language::Python::Virtualenv

  desc "Fast, Extensible Progress Bar for Python and CLI"
  homepage "https://github.com/tqdm/tqdm/"
  url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
  sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  license all_of: ["MIT", "MPL-2.0"]
  head "https://github.com/tqdm/tqdm.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "590cf416013a930e9abbeebae05d89e0e5abb9e9f8ad0d385f5f9ad3706cdc71"
  end

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/tqdm -h")
    assert_match "Usage", output
    assert_match "Options", output
    output = shell_output("#{bin}/tqdm -v")
    assert_match version.to_s, output
  end
end
