cask "macontent10-assetpack-0137-alchemyguitarspluckedglass" do
  version "04ce190ff29f8e5aeeb2e7a24f6a143b-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0137_AlchemyGuitarsPluckedGlass.pkg"
  name "MAContent10_AssetPack_0137_AlchemyGuitarsPluckedGlass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0137_AlchemyGuitarsPluckedGlass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0137_AlchemyGuitarsPluckedGlass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0137_AlchemyGuitarsPluckedGlass"
end
