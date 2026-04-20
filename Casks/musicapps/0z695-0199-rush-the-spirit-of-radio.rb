cask "0z695-0199-rush-the-spirit-of-radio" do
  version "930704ca290c8bebeec65a30f8442f11-77"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0199_Rush_The%20Spirit%20of%20Radio.pkg"
  name "0Z695-0199_Rush_The Spirit of Radio"
  desc "Rush guitarist Alex Lifeson teaches you how to play the intricate opening guitar"
  homepage "https://audiocontentdownload.apple.com/ltp/en/spiritofradio.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0199_Rush_The%20Spirit%20of%20Radio.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0199_Rush_The Spirit of Radio.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0199_Rush_The Spirit of Radio"
end
