cask "macontent10-assetpack-0270-alchemyvocalsfxnnoiseseleanor" do
  version "b83f93df9feeb5df489d70d16bcf6578"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0270_AlchemyVocalsFXNNoisesEleanor.pkg"
  name "MAContent10_AssetPack_0270_AlchemyVocalsFXNNoisesEleanor"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0270_AlchemyVocalsFXNNoisesEleanor.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0270_AlchemyVocalsFXNNoisesEleanor.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0270_AlchemyVocalsFXNNoisesEleanor"
end
