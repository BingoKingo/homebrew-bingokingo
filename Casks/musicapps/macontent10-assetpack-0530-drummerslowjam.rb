cask "macontent10-assetpack-0530-drummerslowjam" do
  version "b4c3e565ae43564943229b0aa6040b75-47"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0530_DrummerSlowJam.pkg"
  name "MAContent10_AssetPack_0530_DrummerSlowJam"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0530_DrummerSlowJam.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0530_DrummerSlowJam.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0530_DrummerSlowJam"
end
