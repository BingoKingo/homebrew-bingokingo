class HomebrewPypiPoet < Formula
  include Language::Python::Virtualenv

  desc "Generates Homebrew resource stanzas for Python packages"
  homepage "https://github.com/tdsmith/homebrew-pypi-poet/"
  url "https://files.pythonhosted.org/packages/f7/d9/4b525af3be6ac0a0a962e101b7771db6511d9e96369ded2765406233f9ff/homebrew-pypi-poet-0.10.0.tar.gz"
  sha256 "e09e997e35a98f66445f9a39ccb33d6d93c5cd090302a59f231707eac0bf378e"
  license "MIT"
  head "https://github.com/tdsmith/homebrew-pypi-poet.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "849a745076819ace3a67104935d852f01db0a1f55224f4b8cdc09fff894e1588"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2afc9505f7e7597013f67b38eddd028f7467c9699da3db31d4e8899b69c37432"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cbd7d8d977d5818723d5b0eb6d760778a8c82618b728c5ee46ca6be4572a9e26"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "80884afa5b359f71dcf9d6e4f3814ce8949a0cfec3d7b0143d2a60f5613311b5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ddcd2ac3b15778668672966df207a6ddb0ba8c0085672f7bf4a4ccc04c033200"
  end
  deprecate! date: "2018-02-23", because: :unmaintained
  depends_on "python-setuptools" => :build
  depends_on "python@3.14"

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7/markupsafe-3.0.3.tar.gz"
    sha256 "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/4f/db/cfac1baf10650ab4d1c111714410d2fbb77ac5a616db26775db562c8fab2/setuptools-82.0.1.tar.gz"
    sha256 "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/poet -h")
    assert_match "usage", output
    assert_match "options", output
    version_output = shell_output("#{bin}/poet -V")
    assert_match "homebrew-pypi-poet #{version}", version_output
  end
end
