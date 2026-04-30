cask "macontent10-assetpack-0269-alchemyvocalsfxnnoisesicelandicfxkit" do
  version "05df7d3c2bc664f75e5534933b125eeb-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0269_AlchemyVocalsFXNNoisesIcelandicFXKit.pkg"
  name "MAContent10_AssetPack_0269_AlchemyVocalsFXNNoisesIcelandicFXKit"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0269_AlchemyVocalsFXNNoisesIcelandicFXKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0269_AlchemyVocalsFXNNoisesIcelandicFXKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0269_AlchemyVocalsFXNNoisesIcelandicFXKit"
end
