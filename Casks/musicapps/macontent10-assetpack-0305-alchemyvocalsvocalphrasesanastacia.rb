cask "macontent10-assetpack-0305-alchemyvocalsvocalphrasesanastacia" do
  version "8640d04630b8298abe9c1eee229c7afc-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0305_AlchemyVocalsVocalPhrasesAnastacia.pkg"
  name "MAContent10_AssetPack_0305_AlchemyVocalsVocalPhrasesAnastacia"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0305_AlchemyVocalsVocalPhrasesAnastacia.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0305_AlchemyVocalsVocalPhrasesAnastacia.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0305_AlchemyVocalsVocalPhrasesAnastacia"
end
