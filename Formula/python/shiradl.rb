class Shiradl < Formula
  include Language::Python::Virtualenv
  desc "Download music from YouTube, YouTube Music and Soundcloud with great metadata"
  homepage "https://github.com/KraXen72/shira/"
  version "1.7.1"
  license "MIT"
  head "https://github.com/KraXen72/shira.git", branch: "master"

  depends_on "ffmpeg"
  depends_on "pillow"
  depends_on "python@3.13"
  depends_on "yt-dlp"

  def install
    resource "attrs" do
      url "https://files.pythonhosted.org/packages/5a/b0/1367933a8532ee6ff8d63537de4f1177af4bff9f3e829baf7331f595bb24/attrs-25.3.0.tar.gz"
      sha256 "75d7cefc7fb576747b2c81b4442d4d4a1ce0900973527c011d1030fd3bf4af1b"
    end

    resource "cattrs" do
      url "https://files.pythonhosted.org/packages/57/2b/561d78f488dcc303da4639e02021311728fb7fda8006dd2835550cddd9ed/cattrs-25.1.1.tar.gz"
      sha256 "c914b734e0f2d59e5b720d145ee010f1fd9a13ee93900922a2f3f9d593b8382c"
    end

    resource "charset-normalizer" do
      url "https://files.pythonhosted.org/packages/e4/33/89c2ced2b67d1c2a61c19c6751aa8902d46ce3dacb23600a283619f5a12d/charset_normalizer-3.4.2.tar.gz"
      sha256 "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"
    end

    resource "click" do
      url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
      sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
    end

    resource "filetype" do
      url "https://files.pythonhosted.org/packages/bb/29/745f7d30d47fe0f251d3ad3dc2978a23141917661998763bebb6da007eb1/filetype-1.2.0.tar.gz"
      sha256 "66b56cd6474bf41d8c54660347d37afcc3f7d1970648de365c102ef77548aadb"
    end

    resource "idna" do
      url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
      sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
    end

    resource "mediafile" do
      url "https://files.pythonhosted.org/packages/86/43/7726b251c591044b4ae2734049260e7a37c7e5b97a3fe1002443f9a3e829/mediafile-0.13.0.tar.gz"
      sha256 "de71063e1bffe9733d6ccad526ea7dac8a9ce760105827f81ab0cb034c729a6d"
    end

    resource "mutagen" do
      url "https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77/mutagen-1.47.0.tar.gz"
      sha256 "719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99"
    end

    resource "pillow" do
      url "https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238/pillow-11.3.0.tar.gz"
      sha256 "3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523"
    end

    resource "platformdirs" do
      url "https://files.pythonhosted.org/packages/f5/52/0763d1d976d5c262df53ddda8d8d4719eedf9594d046f117c25a27261a19/platformdirs-4.2.2.tar.gz"
      sha256 "38b7b51f512eed9e84a22788b4bce1de17c0adb134d6becb09836e37d8654cd3"
    end

    resource "python-dateutil" do
      url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
      sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
    end

    resource "requests" do
      url "https://files.pythonhosted.org/packages/e1/0a/929373653770d8a0d7ea76c37de6e41f11eb07559b103b1c02cafb3f7cf8/requests-2.32.4.tar.gz"
      sha256 "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
    end

    resource "requests-cache" do
      url "https://files.pythonhosted.org/packages/1a/be/7b2a95a9e7a7c3e774e43d067c51244e61dea8b120ae2deff7089a93fb2b/requests_cache-1.2.1.tar.gz"
      sha256 "68abc986fdc5b8d0911318fbb5f7c80eebcd4d01bfacc6685ecf8876052511d1"
    end

    resource "typing-extensions" do
      url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
      sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
    end

    resource "url-normalize" do
      url "https://files.pythonhosted.org/packages/80/31/febb777441e5fcdaacb4522316bf2a527c44551430a4873b052d545e3279/url_normalize-2.2.1.tar.gz"
      sha256 "74a540a3b6eba1d95bdc610c24f2c0141639f3ba903501e61a52a8730247ff37"
    end

    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc/urllib3-2.5.0.tar.gz"
      sha256 "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
    end

    resource "ytmusicapi" do
      url "https://files.pythonhosted.org/packages/87/2e/30b77a0aec8383a5d3b1472e763ff14f845c275c103da78d3c0045cd691a/ytmusicapi-1.10.3.tar.gz"
      sha256 "7235361ac9d5958d49a29f586eec55b1c83e90f7b063361e8a206e1cf4f76216"
    end

    resource "yt-dlp" do
      url "https://files.pythonhosted.org/packages/23/9c/ff64c2fed7909f43a9a0aedb7395c65404e71c2439198764685a6e3b3059/yt_dlp-2025.6.30.tar.gz"
      sha256 "6d0ae855c0a55bfcc28dffba804ec8525b9b955d34a41191a1561a4cec03d8bd"
    end

    virtualenv_install_with_resources
  end

  test do
    system bin/"shiradl", "-h"
  end
end
