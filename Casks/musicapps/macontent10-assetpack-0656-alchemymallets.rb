cask "macontent10-assetpack-0656-alchemymallets" do
  version "9fc96f81c4eba6d8bf6e6240a16f7773"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0656_AlchemyMallets.pkg"
  name "MAContent10_AssetPack_0656_AlchemyMallets"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0656_AlchemyMallets.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0656_AlchemyMallets.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0656_AlchemyMallets"
end
