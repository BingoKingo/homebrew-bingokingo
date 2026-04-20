cask "macontent10-assetpack-0272-alchemyvocalsfxnnoisespercussionkit" do
  version "f1e03ddb7c4361932ae1e0896981a21e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0272_AlchemyVocalsFXNNoisesPercussionKit.pkg"
  name "MAContent10_AssetPack_0272_AlchemyVocalsFXNNoisesPercussionKit"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0272_AlchemyVocalsFXNNoisesPercussionKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0272_AlchemyVocalsFXNNoisesPercussionKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0272_AlchemyVocalsFXNNoisesPercussionKit"
end
