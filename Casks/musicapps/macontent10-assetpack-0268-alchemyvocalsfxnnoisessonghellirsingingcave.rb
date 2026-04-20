cask "macontent10-assetpack-0268-alchemyvocalsfxnnoisessonghellirsingingcave" do
  version "ec6f11ace2139b1e61b3f94618d72990-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0268_AlchemyVocalsFXNNoisesSonghellirSingingCave.pkg"
  name "MAContent10_AssetPack_0268_AlchemyVocalsFXNNoisesSonghellirSingingCave"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0268_AlchemyVocalsFXNNoisesSonghellirSingingCave.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0268_AlchemyVocalsFXNNoisesSonghellirSingingCave.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0268_AlchemyVocalsFXNNoisesSonghellirSingingCave"
end
