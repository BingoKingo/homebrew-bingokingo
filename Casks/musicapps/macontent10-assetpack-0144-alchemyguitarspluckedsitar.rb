cask "macontent10-assetpack-0144-alchemyguitarspluckedsitar" do
  version "b1ffc26418684a7d23cb5ccd2767fde7-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0144_AlchemyGuitarsPluckedSitar.pkg"
  name "MAContent10_AssetPack_0144_AlchemyGuitarsPluckedSitar"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0144_AlchemyGuitarsPluckedSitar.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0144_AlchemyGuitarsPluckedSitar.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0144_AlchemyGuitarsPluckedSitar"
end
