cask "macontent10-assetpack-0281-alchemyvocalssolovocalsmorphseleanor" do
  version "a43728ba29a40945ce0b5ea3b3252979-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0281_AlchemyVocalsSoloVocalsMorphsEleanor.pkg"
  name "MAContent10_AssetPack_0281_AlchemyVocalsSoloVocalsMorphsEleanor"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0281_AlchemyVocalsSoloVocalsMorphsEleanor.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0281_AlchemyVocalsSoloVocalsMorphsEleanor.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0281_AlchemyVocalsSoloVocalsMorphsEleanor"
end
