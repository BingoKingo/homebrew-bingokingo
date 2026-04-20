cask "macontent10-assetpack-0259-alchemyvocalschoirfemale" do
  version "8cfbc6c4f49170369f47c4278e57adc6-17"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0259_AlchemyVocalsChoirFemale.pkg"
  name "MAContent10_AssetPack_0259_AlchemyVocalsChoirFemale"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0259_AlchemyVocalsChoirFemale.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0259_AlchemyVocalsChoirFemale.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0259_AlchemyVocalsChoirFemale"
end
