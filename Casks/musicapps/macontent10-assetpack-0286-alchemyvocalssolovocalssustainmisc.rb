cask "macontent10-assetpack-0286-alchemyvocalssolovocalssustainmisc" do
  version "3271a2e2a52aa99b4c188253d2a01c38-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0286_AlchemyVocalsSoloVocalsSustainMisc.pkg"
  name "MAContent10_AssetPack_0286_AlchemyVocalsSoloVocalsSustainMisc"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0286_AlchemyVocalsSoloVocalsSustainMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0286_AlchemyVocalsSoloVocalsSustainMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0286_AlchemyVocalsSoloVocalsSustainMisc"
end
