cask "2z695-0102-rock-guitar-5-classic-riffs" do
  version "7d172c0ad2cb882c5dcba324f0e63715-122"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0102_Rock%20Guitar%205_Classic%20Riffs.pkg"
  name "2Z695-0102_Rock Guitar 5_Classic Riffs"
  desc "Classic Riffs"
  homepage "https://audiocontentdownload.apple.com/ltp/en/rockguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0102_Rock%20Guitar%205_Classic%20Riffs.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0102_Rock Guitar 5_Classic Riffs.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0102_Rock Guitar 5_Classic Riffs"
end
