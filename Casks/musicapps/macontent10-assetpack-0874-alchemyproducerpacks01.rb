cask "macontent10-assetpack-0874-alchemyproducerpacks01" do
  version "503f11674a3a8389e1ebb4cf774c6df0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0874_AlchemyProducerPacks01.pkg"
  name "MAContent10_AssetPack_0874_AlchemyProducerPacks01"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0874_AlchemyProducerPacks01.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0874_AlchemyProducerPacks01.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0874_AlchemyProducerPacks01"
end
