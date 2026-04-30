cask "macontent10-assetpack-0022-alchemydrumsmisc" do
  version "154b3ae426689683f75a03b8ce6b3c3e-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0022_AlchemyDrumsMisc.pkg"
  name "MAContent10_AssetPack_0022_AlchemyDrumsMisc"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0022_AlchemyDrumsMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0022_AlchemyDrumsMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0022_AlchemyDrumsMisc"
end
