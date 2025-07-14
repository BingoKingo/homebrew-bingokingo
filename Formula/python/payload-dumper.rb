class PayloadDumper < Formula
  include Language::Python::Virtualenv
  desc "Dump Android's payload.bin online"
  homepage "https://github.com/5ec1cff/payload-dumper/"
  head "https://github.com/5ec1cff/payload-dumper.git", branch: "master"

  depends_on "protobuf"
  depends_on "python@3.13"

  def install
    resource "httpx" do
      url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
      sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
    end

    resource "protobuf" do
      url "https://files.pythonhosted.org/packages/52/f3/b9655a711b32c19720253f6f06326faf90580834e2e83f840472d752bc8b/protobuf-6.31.1.tar.gz"
      sha256 "d8cac4c982f0b957a4dc73a80e2ea24fab08e679c0de9deb835f4a12d69aca9a"
    end

    resource "bsdiff4" do
      url "https://files.pythonhosted.org/packages/53/b9/4559ede9a4c8c4451688303544da84654643fdc7f28790aca85be80b4b7c/bsdiff4-1.2.6.tar.gz"
      sha256 "2ab57d01a78b39e29e5accc9cfead4130982ded9dccbc4261bd0e9c51d6b751d"
    end

    resource "enlighten" do
      url "https://files.pythonhosted.org/packages/8d/87/50b1152a85e3dca202e9e28ba2594c03edce8b9e74187b3aef5b98e4b631/enlighten-1.14.1.tar.gz"
      sha256 "85c35412a9a4f3886b3337d41f813441fab9a30d9f5b5f0c015bd078a4411473"
    end

    resource "idna" do
      url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
      sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
    end

    resource "blessed" do
      url "https://files.pythonhosted.org/packages/0c/5e/3cada2f7514ee2a76bb8168c71f9b65d056840ebb711962e1ec08eeaa7b0/blessed-1.21.0.tar.gz"
      sha256 "ece8bbc4758ab9176452f4e3a719d70088eb5739798cd5582c9e05f2a28337ec"
    end

    resource "wcwidth" do
      url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
      sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
    end

    resource "prefixed" do
      url "https://files.pythonhosted.org/packages/48/ae/296470eca349da35bdec573e54320afa2b5b099c582e5d97be8bccac247e/prefixed-0.9.0.tar.gz"
      sha256 "164403fa9ebc83280bbc4705f4b243a28837e164310b4e65c38ccab1ebafeeb3"
    end

    virtualenv_install_with_resources
    bin.install_symlink "payload_dumper" => "payload-dumper"
  end

  test do
    system bin/"payload-dumper", "-h"
  end
end
