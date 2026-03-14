class Ffsubsync < Formula
  include Language::Python::Virtualenv

  desc "Language-agnostic synchronization of subtitles with video"
  homepage "https://github.com/smacke/ffsubsync/"
  url "https://github.com/smacke/ffsubsync/archive/refs/tags/0.4.31.tar.gz"
  sha256 "7fac9de45d0bae599dc58e3efbe22c771372e25290141389c59b49a046b7cb09"
  license "MIT"
  head "https://github.com/smacke/ffsubsync.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "7a08bb13d06d87619b337a135d64a1f6a9097c1517995c4c21ddaf9702983949"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "985a28c64db971af2b003a85e98d62740cf2d244c60e042c57e168e934bc2f48"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "267e623b8d8a1edf0c437a27c38c7bec9586903d5a6d38f0a08407664df24e7f"
  end

  depends_on "python-setuptools" => :build
  depends_on "chardet"
  depends_on "ffmpeg"
  depends_on "numpy"
  depends_on "pygments"
  depends_on "python@3.14"
  depends_on "rich-cli"

  pypi_packages extra_packages: %w[faust-cchardet six]

  resource "auditok" do
    url "https://files.pythonhosted.org/packages/7a/10/36727094aeb828ad4d9bc70e9c5bb422b1abf64d2b5fe8ad305ce337522b/auditok-0.1.5.tar.gz"
    sha256 "1cdb30f552cfed7120b3c1365faa7bca00cce3b0305b13188e9b62a649c58a0e"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/6c/80/4684035f1a2a3096506bc377276a815ccf0be3c3316eab35d589e82d9f3c/chardet-7.0.1.tar.gz"
    sha256 "6fce895c12c5495bb598e59ae3cd89306969b4464ec7b6dd609b9c86e3397fe3"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24/charset_normalizer-3.4.5.tar.gz"
    sha256 "95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644"
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
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/10/8b/c265f4823726ab832de836cdd184d0986dcf94480f81e8739692a7ac7af2/numpy-2.4.3.tar.gz"
    sha256 "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "pysubs2" do
    url "https://files.pythonhosted.org/packages/31/4a/becf78d9d3df56e6c4a9c50b83794e5436b6c5ab6dd8a3f934e94c89338c/pysubs2-1.8.0.tar.gz"
    sha256 "3397bb58a4a15b1325ba2ae3fd4d7c214e2c0ddb9f33190d6280d783bb433b20"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393/rich-14.3.3.tar.gz"
    sha256 "b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/4f/db/cfac1baf10650ab4d1c111714410d2fbb77ac5a616db26775db562c8fab2/setuptools-82.0.1.tar.gz"
    sha256 "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "srt" do
    url "https://files.pythonhosted.org/packages/66/b7/4a1bc231e0681ebf339337b0cd05b91dc6a0d701fa852bb812e244b7a030/srt-3.5.3.tar.gz"
    sha256 "4884315043a4f0740fd1f878ed6caa376ac06d70e135f306a6dc44632eed0cc0"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "webrtcvad" do
    url "https://files.pythonhosted.org/packages/89/34/e2de2d97f3288512b9ea56f92e7452f8207eb5a0096500badf9dfd48f5e6/webrtcvad-2.0.10.tar.gz"
    sha256 "f1bed2fb25b63fb7b1a55d64090c993c9c9167b28485ae0bcdd81cf6ede96aea"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/ffsubsync -h")
    assert_match "usage", output
    assert_match "Synchronize subtitles with video.", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/ffsubsync -v")
    assert_match "ffsubsync #{version}", version_output
  end
end
