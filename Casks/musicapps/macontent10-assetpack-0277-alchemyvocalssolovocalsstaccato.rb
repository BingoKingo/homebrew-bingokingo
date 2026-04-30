cask "macontent10-assetpack-0277-alchemyvocalssolovocalsstaccato" do
  version "9500a2a145f96b9ab311e7c18f59f241-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0277_AlchemyVocalsSoloVocalsStaccato.pkg"
  name "MAContent10_AssetPack_0277_AlchemyVocalsSoloVocalsStaccato"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0277_AlchemyVocalsSoloVocalsStaccato.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0277_AlchemyVocalsSoloVocalsStaccato.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0277_AlchemyVocalsSoloVocalsStaccato"
end
