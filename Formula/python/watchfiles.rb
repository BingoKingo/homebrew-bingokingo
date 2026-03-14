class Watchfiles < Formula
  include Language::Python::Virtualenv

  desc "File watching and code reload"
  homepage "https://watchfiles.helpmanual.io/"
  url "https://files.pythonhosted.org/packages/c2/c9/8869df9b2a2d6c59d79220a4db37679e74f807c559ffe5265e08b227a210/watchfiles-1.1.1.tar.gz"
  sha256 "a173cb5c16c4f40ab19cecf48a534c409f7ea983ab8fed0741304a1c0a31b3f2"
  license "MIT"
  head "https://github.com/samuelcolvin/watchfiles.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "a66b67d1d36189be022171776df8fa377450e26f98dffe29846ca74a23c7852e"
    sha256 cellar: :any,                 arm64_sequoia: "1aeaf2de1edce5478e3724c64f1d1b94341187921439085add693c6322c20fc7"
    sha256 cellar: :any,                 arm64_sonoma:  "6120fcc942dd7ca50b431f1c8f93753765a0dbf87294ee8d198abc35844e1886"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d210c84c8e6f9a730880fbfefc3af2e200a2bfbe47191a41175e431a16bcbd8e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "09324cedf5e1c798bee81d372cd9d82f9f6529cd0461a9707395c729e0710098"
  end

  depends_on "maturin" => :build
  depends_on "rust" => :build
  depends_on "python@3.14"

  pypi_packages extra_packages: %w[sniffio]

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/96/f0/5eb65b2bb0d09ac6776f2eb54adee6abe8228ea05b20a5ad0e4945de8aac/anyio-4.12.1.tar.gz"
    sha256 "41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/watchfiles -h")
    assert_match "usage", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/watchfiles -V")
    assert_match "watchfiles v#{version}", version_output
  end
end
