cask "macontent10-assetpack-0041-alchemypadsdigitalbeginpad" do
  version "7e913015c9e763579efe2e8a0856cc14-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0041_AlchemyPadsDigitalBeginPad.pkg"
  name "MAContent10_AssetPack_0041_AlchemyPadsDigitalBeginPad"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0041_AlchemyPadsDigitalBeginPad.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0041_AlchemyPadsDigitalBeginPad.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0041_AlchemyPadsDigitalBeginPad"
end
