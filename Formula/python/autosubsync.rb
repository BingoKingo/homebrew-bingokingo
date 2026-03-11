class Autosubsync < Formula
  include Language::Python::Virtualenv

  desc "Human friendly output for text interfaces using Python"
  homepage "https://github.com/oseiskar/autosubsync/"
  url "https://github.com/oseiskar/autosubsync/archive/refs/tags/1.0.1.tar.gz"
  sha256 "d2eff0b327b53d4c5a522c607337f068b7ab8518ea7fdc4231eb4ad9c5b13e9a"
  license "MIT"
  head "https://github.com/oseiskar/autosubsync.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any, arm64_tahoe:   "c59a3c0246d4f3794cc7dc6dd5f824e2b560ffa61beb6ca37e04426e433ba8d5"
    sha256 cellar: :any, arm64_sequoia: "826de1543b37ac6ae7b8ddc63539761a70c490237c62158f1dec0e885b8e036a"
    sha256 cellar: :any, arm64_sonoma:  "d197734b7723c7c4af75a7710e56ba99f71fc505510d64e074b5243fbda905e5"
  end

  depends_on "cffi"
  depends_on "numpy"
  depends_on "pycparser"
  depends_on "python@3.14"

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/10/8b/c265f4823726ab832de836cdd184d0986dcf94480f81e8739692a7ac7af2/numpy-2.4.3.tar.gz"
    sha256 "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  resource "pysoundfile" do
    url "https://files.pythonhosted.org/packages/07/fa/bbe4d1c4328eaa83c0656c729eabbf811377fc1e8416d42bf7f7af63ef8c/PySoundFile-0.9.0.post1.tar.gz"
    sha256 "43dd46a2afc0484c26930a7e59eef9365cee81bce7a4aadc5699f788f60d32c3"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/autosubsync -h")
    assert_match "usage", output
    assert_match "positional arguments", output
    assert_match "options", output
  end
end
