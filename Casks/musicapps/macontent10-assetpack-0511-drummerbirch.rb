cask "macontent10-assetpack-0511-drummerbirch" do
  version "538def68c846c4820570d4fb9d5469ff-98"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0511_DrummerBirch.pkg"
  name "MAContent10_AssetPack_0511_DrummerBirch"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0511_DrummerBirch.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0511_DrummerBirch.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0511_DrummerBirch"
end
