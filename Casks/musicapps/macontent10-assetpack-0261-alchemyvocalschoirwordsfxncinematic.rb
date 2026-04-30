cask "macontent10-assetpack-0261-alchemyvocalschoirwordsfxncinematic" do
  version "971cddba9c7b396baa9d2546f16163ee"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0261_AlchemyVocalsChoirWordsFXNCinematic.pkg"
  name "MAContent10_AssetPack_0261_AlchemyVocalsChoirWordsFXNCinematic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0261_AlchemyVocalsChoirWordsFXNCinematic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0261_AlchemyVocalsChoirWordsFXNCinematic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0261_AlchemyVocalsChoirWordsFXNCinematic"
end
