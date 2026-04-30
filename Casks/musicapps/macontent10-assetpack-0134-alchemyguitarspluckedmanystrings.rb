cask "macontent10-assetpack-0134-alchemyguitarspluckedmanystrings" do
  version "7ab93c8920aa14e70d6b96cafcdea1c0-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0134_AlchemyGuitarsPluckedManyStrings.pkg"
  name "MAContent10_AssetPack_0134_AlchemyGuitarsPluckedManyStrings"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0134_AlchemyGuitarsPluckedManyStrings.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0134_AlchemyGuitarsPluckedManyStrings.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0134_AlchemyGuitarsPluckedManyStrings"
end
