cask "macontent10-assetpack-0283-alchemyvocalssolovocalssustainanastacia" do
  version "14819d97c237d22aef36689542d33a4c-27"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0283_AlchemyVocalsSoloVocalsSustainAnastacia.pkg"
  name "MAContent10_AssetPack_0283_AlchemyVocalsSoloVocalsSustainAnastacia"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0283_AlchemyVocalsSoloVocalsSustainAnastacia.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0283_AlchemyVocalsSoloVocalsSustainAnastacia.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0283_AlchemyVocalsSoloVocalsSustainAnastacia"
end
