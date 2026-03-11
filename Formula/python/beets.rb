class Beets < Formula
  include Language::Python::Virtualenv

  desc "Music geek’s media organizer"
  homepage "https://beets.readthedocs.io/"
  url "https://files.pythonhosted.org/packages/b6/c4/b18579bf9d60ade2f0528fa7546874c271001cbd635c7c8911262402a048/beets-2.7.0.tar.gz"
  sha256 "129f315810e381e0dbb4236fb3fa59bf0af79fdf5c2d4844b4586ac08ec25a72"
  license "MIT"
  head "https://github.com/beetbox/beets.git", branch: "master"

  depends_on "maturin" => :build
  depends_on "python-setuptools" => :build
  depends_on "rust" => :build
  depends_on "libyaml"
  depends_on "numpy"
  depends_on "python@3.14"

  resource "confuse" do
    url "https://files.pythonhosted.org/packages/a2/a6/444c7376439851ce1d07932f88b707910d4605466d1c313621943c738112/confuse-2.2.0.tar.gz"
    sha256 "35c1b53e81be125f441bee535130559c935917b26aeaa61289010cd1f55c2b9e"
  end

  resource "filetype" do
    url "https://files.pythonhosted.org/packages/bb/29/745f7d30d47fe0f251d3ad3dc2978a23141917661998763bebb6da007eb1/filetype-1.2.0.tar.gz"
    sha256 "66b56cd6474bf41d8c54660347d37afcc3f7d1970648de365c102ef77548aadb"
  end

  resource "jellyfish" do
    url "https://files.pythonhosted.org/packages/0b/14/fc5bdb637996df181e5c4fa3b15dcc27d33215e6c41753564ae453bdb40f/jellyfish-1.2.1.tar.gz"
    sha256 "72d2fda61b23babe862018729be73c8b0dc12e3e6601f36f6e65d905e249f4db"
  end

  resource "lap" do
    url "https://files.pythonhosted.org/packages/f1/ae/5cc637c2e5158b7dcf1a9744d33b11dfc21d9309931169402f573e4d1ee3/lap-0.5.13.tar.gz"
    sha256 "9eff7169e3ca452995af0493cc20d35452c4bfd06122c36c06457119ffbd411b"
  end

  resource "mediafile" do
    url "https://files.pythonhosted.org/packages/86/43/7726b251c591044b4ae2734049260e7a37c7e5b97a3fe1002443f9a3e829/mediafile-0.13.0.tar.gz"
    sha256 "de71063e1bffe9733d6ccad526ea7dac8a9ce760105827f81ab0cb034c729a6d"
  end

  resource "musicbrainzngs" do
    url "https://files.pythonhosted.org/packages/0a/67/3e74ae93d90ceeba72ed1a266dd3ca9abd625f315f0afd35f9b034acedd1/musicbrainzngs-0.7.1.tar.gz"
    sha256 "ab1c0100fd0b305852e65f2ed4113c6de12e68afd55186987b8ed97e0f98e627"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77/mutagen-1.47.0.tar.gz"
    sha256 "719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/37/7d/3fec4199c5ffb892bed55cff901e4f39a58c81df9c44c280499e92cad264/numpy-2.3.2.tar.gz"
    sha256 "e0486a11ec30cdecb53f184d496d1c6a20786c81e55e41640270130056f8ee48"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/fe/8b/3c73abc9c759ecd3f1f7ceff6685840859e8070c4d947c93fae71f6a0bf2/platformdirs-4.3.8.tar.gz"
    sha256 "3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "unidecode" do
    url "https://files.pythonhosted.org/packages/94/7d/a8a765761bbc0c836e397a2e48d498305a865b70a8600fd7a942e85dcf63/Unidecode-1.4.0.tar.gz"
    sha256 "ce35985008338b676573023acc382d62c264f307c8f7963733405add37ea2b23"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink "beet" => "beets"
  end

  test do
    system bin/"beet", "-h"
  end
end
