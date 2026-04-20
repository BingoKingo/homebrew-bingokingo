cask "2z695-0100-rock-guitar-3-drop-d-and-heavy-riffs" do
  version "b4b8933b1af00716a89fd4038ace4784-72"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0100_Rock%20Guitar%203_Drop%20D%20and%20Heavy%20Riffs.pkg"
  name "2Z695-0100_Rock Guitar 3_Drop D and Heavy Riffs"
  desc "Drop-D Tuning and Heavy Riffs"
  homepage "https://audiocontentdownload.apple.com/ltp/en/rockguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0100_Rock%20Guitar%203_Drop%20D%20and%20Heavy%20Riffs.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0100_Rock Guitar 3_Drop D and Heavy Riffs.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0100_Rock Guitar 3_Drop D and Heavy Riffs"
end
