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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b8ea4393efdc286fa8ad211f26af3e92a9453f305759c290cee7233c8fad7cb8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c1920ff06bf541cee45b8b13257cff7082418a8d16d71a626057c63e9f6fe0cf"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "36938e569448af563da34767f04ad8e0234cc290210ec8dcf4c6515661b78f62"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "41a281f8a7a711c58071a1a25e6163ce736a117f7bde94b129902cc8a0beea94"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5adc5385a5a96598f8b01eda7870c5f0096af3762b03ec989b2271f013121a27"
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
    url "https://files.pythonhosted.org/packages/5a/96/686339e0fda8142b7ebed39af53f4a5694602a729662f42a6209e3be91d0/fonttools-4.62.0.tar.gz"
    sha256 "0dc477c12b8076b4eb9af2e440421b0433ffa9e1dcb39e0640a6c94665ed1098"
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
