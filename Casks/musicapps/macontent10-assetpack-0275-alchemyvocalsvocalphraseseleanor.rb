cask "macontent10-assetpack-0275-alchemyvocalsvocalphraseseleanor" do
  version "4a2d81e8bdcf00e4c99ac5d49f5ae66e-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0275_AlchemyVocalsVocalPhrasesEleanor.pkg"
  name "MAContent10_AssetPack_0275_AlchemyVocalsVocalPhrasesEleanor"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0275_AlchemyVocalsVocalPhrasesEleanor.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0275_AlchemyVocalsVocalPhrasesEleanor.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0275_AlchemyVocalsVocalPhrasesEleanor"
end
