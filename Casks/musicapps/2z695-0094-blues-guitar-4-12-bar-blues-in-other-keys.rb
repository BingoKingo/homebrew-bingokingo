cask "2z695-0094-blues-guitar-4-12-bar-blues-in-other-keys" do
  version "34815242b672d565d521e90b273549c5-112"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0094_Blues%20Guitar%204_12%20Bar%20Blues%20in%20Other%20Keys.pkg"
  name "2Z695-0094_Blues Guitar 4_12 Bar Blues in Other Keys"
  desc "12 Bar Blues in Other Keys"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0094_Blues%20Guitar%204_12%20Bar%20Blues%20in%20Other%20Keys.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0094_Blues Guitar 4_12 Bar Blues in Other Keys.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0094_Blues Guitar 4_12 Bar Blues in Other Keys"
end
