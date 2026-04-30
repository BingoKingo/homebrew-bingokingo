cask "macontent10-assetpack-0278-alchemyvocalssolovocalsmorphsamanda" do
  version "0a93c9f9171b0ba966dd74701f24e4db-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0278_AlchemyVocalsSoloVocalsMorphsAmanda.pkg"
  name "MAContent10_AssetPack_0278_AlchemyVocalsSoloVocalsMorphsAmanda"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0278_AlchemyVocalsSoloVocalsMorphsAmanda.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0278_AlchemyVocalsSoloVocalsMorphsAmanda.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0278_AlchemyVocalsSoloVocalsMorphsAmanda"
end
