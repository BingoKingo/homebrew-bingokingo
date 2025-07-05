class Ffsubsync < Formula
  include Language::Python::Virtualenv
  desc "Language-agnostic synchronization of subtitles with video"
  homepage "https://github.com/smacke/ffsubsync/"
  # url "https://files.pythonhosted.org/packages/ba/e7/757e97be9cf9b108de4875a4fe823e7ffcbe29347217050ec494706a9efe/ffsubsync-0.4.27.tar.gz"
  # sha256 "66bcbbded86dd003cce472e5f3db608c38fb102bc3efa6c72f98e1e4472d5426"
  url "https://github.com/smacke/ffsubsync/archive/refs/tags/0.4.26.tar.gz"
  sha256 "eab5f26d56f3e34f3220c7de337e037a4d0c4a0d1335da63af96fd7a3f1369cc"
  license "MIT"
  head "https://github.com/smacke/ffsubsync.git", branch: "master"

  depends_on "chardet"
  depends_on "ffmpeg"
  depends_on "numpy"
  depends_on "pygments"
  depends_on "python-setuptools"
  depends_on "python@3.13"
  depends_on "rich-cli"
  depends_on "six"

  resource "auditok" do
    url "https://files.pythonhosted.org/packages/0e/05/57e6c498cc8b224dc3d057136ce40f983c55a02d1f279ffcf73c544ffdc0/auditok-0.3.0.tar.gz"
    sha256 "8565d6e7dfbecb7dbbe5c54fb5af66f8c1c827e06745c19df0e3fa468d0022a1"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357/charset_normalizer-3.4.1.tar.gz"
    sha256 "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
  end

  resource "faust-cchardet" do
    url "https://files.pythonhosted.org/packages/e9/53/2125d17d7c2a14b76303bf5c3c5db35ea8e4b8a14817bb191c601d67e288/faust-cchardet-2.1.19.tar.gz"
    sha256 "f89386297cde0c8e0f5e21464bc2d6d0e4a4fc1b1d77cdb238ca24d740d872e0"
  end

  resource "ffmpeg-python" do
    url "https://files.pythonhosted.org/packages/dd/5e/d5f9105d59c1325759d838af4e973695081fbbc97182baf73afc78dec266/ffmpeg-python-0.2.0.tar.gz"
    sha256 "65225db34627c578ef0e11c8b1eb528bb35e024752f6f10b78c011f6f64c4127"
  end

  resource "future" do
    url "https://files.pythonhosted.org/packages/a7/b2/4140c69c6a66432916b26158687e821ba631a4c9273c474343badf84d3ba/future-1.0.0.tar.gz"
    sha256 "bd2968309307861edae1458a4f8a4f3598c03be43b97521076aebf5d94c07b05"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "srt" do
    url "https://files.pythonhosted.org/packages/66/b7/4a1bc231e0681ebf339337b0cd05b91dc6a0d701fa852bb812e244b7a030/srt-3.5.3.tar.gz"
    sha256 "4884315043a4f0740fd1f878ed6caa376ac06d70e135f306a6dc44632eed0cc0"
  end

  resource "pysubs2" do
    url "https://files.pythonhosted.org/packages/31/4a/becf78d9d3df56e6c4a9c50b83794e5436b6c5ab6dd8a3f934e94c89338c/pysubs2-1.8.0.tar.gz"
    sha256 "3397bb58a4a15b1325ba2ae3fd4d7c214e2c0ddb9f33190d6280d783bb433b20"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "webrtcvad-wheels" do
    url "https://files.pythonhosted.org/packages/28/ba/3a8ce2cff3eee72a39ed190e5f9dac792da1526909c97a11589590b21739/webrtcvad_wheels-2.0.14.tar.gz"
    sha256 "5f59c8e291c6ef102d9f39532982fbf26a52ce2de6328382e2654b0960fea397"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"ffsubsync", "-h"
  end
end
