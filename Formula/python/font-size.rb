class FontSize < Formula
  include Language::Python::Virtualenv

  desc "Font file size and individual OpenType table size command-line reporting tool"
  homepage "https://github.com/source-foundry/font-size/"
  url "https://files.pythonhosted.org/packages/2f/87/1072186eaa0d888f5989a5c32188306df9a10e89276a424f0425ed65b404/font-size-0.1.2.tar.gz"
  sha256 "a50320f57c8e5c9d0f6b675f20a2b1b02b77ab46bbbd635334553ea5faae47de"
  license "Apache-2.0"
  head "https://github.com/source-foundry/font-size.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "bc6786bb297ce7d9853c4722d2f0b195627c69bb312a3ec63718ceaa416946da"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "94a6329cd5005bb06c40e6bcffdbb6db449fe15a4fa02a773cf60b91a446c4fe"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "287b5cf6a3cbb48898815ea843f8edace9377b7387027b90a24ce87f9bdd8492"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "3bf6a1e03f4867a9ce6b68dff43b968a60a742c6e465beb1133c9356b8c70656"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "da9a9a881c5687a05da1a41d967005b2df32adb62ed56279911a66a8e5f8c1c6"
  end

  depends_on "brotli"
  depends_on "fonttools"
  depends_on "pygments"
  depends_on "python@3.14"
  depends_on "rich-cli"

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285/brotli-1.2.0.tar.gz"
    sha256 "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393/rich-14.3.3.tar.gz"
    sha256 "b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/font-size -h")
    assert_match "usage", output
    assert_match "Font file and OpenType table size reporting tool", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/font-size --version")
    assert_match "font-size v#{version}", version_output
  end
end
