cask "macontent10-assetpack-0260-alchemyvocalschoirmale" do
  version "367cf1c122f5c75ee47fc5691127158c-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0260_AlchemyVocalsChoirMale.pkg"
  name "MAContent10_AssetPack_0260_AlchemyVocalsChoirMale"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0260_AlchemyVocalsChoirMale.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0260_AlchemyVocalsChoirMale.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0260_AlchemyVocalsChoirMale"
end
