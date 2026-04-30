cask "macontent10-assetpack-0003-alchemybrass" do
  version "e6e6c22a3db6f26ccc5304c72d1111a1-13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0003_AlchemyBrass.pkg"
  name "MAContent10_AssetPack_0003_AlchemyBrass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0003_AlchemyBrass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0003_AlchemyBrass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0003_AlchemyBrass"
end
