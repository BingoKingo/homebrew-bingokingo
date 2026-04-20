cask "macontent10-assetpack-0254-alchemysynthsdigitalspersonality" do
  version "8705ad4143de25895c8b6eaf4b38e0cf-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0254_AlchemySynthsDigitalSPersonality.pkg"
  name "MAContent10_AssetPack_0254_AlchemySynthsDigitalSPersonality"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0254_AlchemySynthsDigitalSPersonality.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0254_AlchemySynthsDigitalSPersonality.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0254_AlchemySynthsDigitalSPersonality"
end
