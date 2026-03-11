class YtdlSub < Formula
  include Language::Python::Virtualenv

  desc "Automate downloading and metadata generation with Yt-dlp"
  homepage "https://ytdl-sub.readthedocs.io/"
  url "https://files.pythonhosted.org/packages/6e/bd/3aa7b1d4b7d59c2eda6d1775996a12201753861c8cbc3d3b5e0a39c04819/ytdl_sub-2026.3.5.tar.gz"
  sha256 "c458af79a16242f9e0217c4c9688a520b80648555ee74774a940a58fb36ca9b6"
  license "GPL-3.0-or-later"
  head "https://github.com/jmbannon/ytdl-sub.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "84d50f4f0551c2da13994d13c4a9be8025b78f8d670cdeb311e6eb5c3dde17bf"
    sha256 cellar: :any,                 arm64_sequoia: "2d0a1c24ebf0db9544536c399d04dea4ee64a09a59377063881cd106a15c0300"
    sha256 cellar: :any,                 arm64_sonoma:  "bf80156bff3066fab49d80a1ae3a8144fa018378c8a902d86b35d8a079462ec6"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "6619031bcd6637652b0a76260354969b3917c24f8a611ffdab14bbd5c6d3e34d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "89af2612443530d98dc49ca74e675fc83e07788e12d19f452d484cd4ab24c090"
  end

  depends_on "brotli"
  depends_on "certifi"
  depends_on "libyaml"
  depends_on "python@3.14"
  depends_on "yt-dlp"

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285/brotli-1.2.0.tar.gz"
    sha256 "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd/certifi-2026.2.25.tar.gz"
    sha256 "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24/charset_normalizer-3.4.5.tar.gz"
    sha256 "95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "filetype" do
    url "https://files.pythonhosted.org/packages/bb/29/745f7d30d47fe0f251d3ad3dc2978a23141917661998763bebb6da007eb1/filetype-1.2.0.tar.gz"
    sha256 "66b56cd6474bf41d8c54660347d37afcc3f7d1970648de365c102ef77548aadb"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "mediafile" do
    url "https://files.pythonhosted.org/packages/f8/fc/d7b8cd62a47626a84db7a07d211202901efcb81c49d55eb3ed128b54fdfe/mediafile-0.14.0.tar.gz"
    sha256 "4b56aeae5cad227f25c11721347a8d85e502080852ddc6351fd43e6cdf6fa3f7"
  end

  resource "mergedeep" do
    url "https://files.pythonhosted.org/packages/3a/41/580bb4006e3ed0361b8151a01d324fb03f420815446c7def45d02f74c270/mergedeep-1.3.4.tar.gz"
    sha256 "0096d52e9dad9939c3d975a774666af186eda617e6ca84df4c94dec30004f2a8"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77/mutagen-1.47.0.tar.gz"
    sha256 "719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/c9/85/e24bf90972a30b0fcd16c73009add1d7d7cd9140c2498a68252028899e41/pycryptodomex-3.23.0.tar.gz"
    sha256 "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/04/24/4b2031d72e840ce4c1ccb255f693b15c334757fc50023e4db9537080b8c4/websockets-16.0.tar.gz"
    sha256 "5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5"
  end

  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/66/6f/7427d23609353e5ef3470ff43ef551b8bd7b166dd4fef48957f0d0e040fe/yt_dlp-2026.3.3.tar.gz"
    sha256 "3db7969e3a8964dc786bdebcffa2653f31123bf2a630f04a17bdafb7bbd39952"
  end

  resource "yt-dlp-ejs" do
    url "https://files.pythonhosted.org/packages/6b/0d/b9e4ab1b47cdeba0842df634b74b3c0144307640ad5b632a5e189c4ab7ce/yt_dlp_ejs-0.5.0.tar.gz"
    sha256 "8dfae59e418232f485253dcf8e197fefa232423c3af7824fe19e4517b173293b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/ytdl-sub -h")
    assert_match "usage", output
    assert_match "ytdl-sub: Automate download and adding metadata with YoutubeDL", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/ytdl-sub -v")
    date_version = version.to_s.split(".post").first
    assert_match "ytdl-sub #{date_version}", version_output
  end
end
