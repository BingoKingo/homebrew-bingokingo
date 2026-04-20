cask "0z695-0062-squeeze-black-coffee-in-bed" do
  version "61a544ede7f3b812f14008fb3bc4e315-143"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0062_Squeeze_Black%20Coffee%20in%20Bed.pkg"
  name "0Z695-0062_Squeeze_Black Coffee in Bed"
  desc "Glenn Tilbrook from the British band Squeeze teaches all the guitar parts to the"
  homepage "https://audiocontentdownload.apple.com/ltp/en/blackcoffee.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0062_Squeeze_Black%20Coffee%20in%20Bed.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0062_Squeeze_Black Coffee in Bed.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0062_Squeeze_Black Coffee in Bed"
end
