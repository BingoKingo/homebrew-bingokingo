cask "macontent10-assetpack-0554-appleloopsdiscofunk2" do
  version "bd78baeb7af8c7891cea235c3e531285-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0554_AppleLoopsDiscoFunk2.pkg"
  name "MAContent10_AssetPack_0554_AppleLoopsDiscoFunk2"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0554_AppleLoopsDiscoFunk2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0554_AppleLoopsDiscoFunk2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0554_AppleLoopsDiscoFunk2"
end
