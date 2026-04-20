cask "2z695-0093-blues-guitar-3-blues-rhythm-riffs" do
  version "bca912c589b74cb431005fd0176bf11a-74"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0093_Blues%20Guitar%203_Blues%20Rhythm%20Riffs.pkg"
  name "2Z695-0093_Blues Guitar 3_Blues Rhythm Riffs"
  desc "Blues Rhythm Riffs"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0093_Blues%20Guitar%203_Blues%20Rhythm%20Riffs.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0093_Blues Guitar 3_Blues Rhythm Riffs.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0093_Blues Guitar 3_Blues Rhythm Riffs"
end
