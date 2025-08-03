class Beets < Formula
  include Language::Python::Virtualenv
  desc "Music geek’s media organizer"
  homepage "https://beets.readthedocs.io/"
  url "https://files.pythonhosted.org/packages/b5/c5/7a328e8049874fb7799b32bb268c29408c7ca2f2326d7c5c83c3985519a6/beets-2.3.1.tar.gz"
  sha256 "87598721a14af89a06d5ad3d9e8138f8ac112510271a981a90b840ed784d5712"
  license "MIT"
  head "https://github.com/beetbox/beets.git", branch: "master"

  depends_on "maturin" => :build
  depends_on "python-setuptools" => :build
  depends_on "rust" => :build
  depends_on "libyaml"
  depends_on "numpy"
  depends_on "python@3.13"

  resource "confuse" do
    url "https://files.pythonhosted.org/packages/a7/77/05e2284baff5f2106f74b528b9930caf764d6c400733eb42e617c4234a7d/confuse-2.0.1.tar.gz"
    sha256 "7379a2ad49aaa862b79600cc070260c1b7974d349f4fa5e01f9afa6c4dd0611f"
  end

  resource "filetype" do
    url "https://files.pythonhosted.org/packages/bb/29/745f7d30d47fe0f251d3ad3dc2978a23141917661998763bebb6da007eb1/filetype-1.2.0.tar.gz"
    sha256 "66b56cd6474bf41d8c54660347d37afcc3f7d1970648de365c102ef77548aadb"
  end

  resource "jellyfish" do
    url "https://files.pythonhosted.org/packages/7c/29/c0d39be806b5d5c201e9bf5265e43cf0e88bd63fb4e38edfc7a212ca38a7/jellyfish-1.2.0.tar.gz"
    sha256 "5c7d73db4045dcc53b6efbfea21f3d3da432d3e052dc51827574d1a447fc23b4"
  end

  resource "lap" do
    url "https://files.pythonhosted.org/packages/6c/cf/ef745c8977cbb26fba5f8433fd4bfd6bf009a90802c0a1cc7139e11f478b/lap-0.5.12.tar.gz"
    sha256 "570b414ea7ae6c04bd49d0ec8cdac1dc5634737755784d44e37f9f668bab44fd"
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
