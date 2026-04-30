cask "macontent10-assetpack-0952-studiobassamericanupright" do
  version "a7bf532039b0442e241fca5548896a02-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0952_StudioBassAmericanUpright.pkg"
  name "MAContent10_AssetPack_0952_StudioBassAmericanUpright"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0952_StudioBassAmericanUpright.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0952_StudioBassAmericanUpright.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0952_StudioBassAmericanUpright"
end
