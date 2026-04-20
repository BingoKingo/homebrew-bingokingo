cask "macontent10-assetpack-0873-irsproducerpacks01" do
  version "dc8a0c2b1ea58047a6a8355cdf21fade-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0873_IRsProducerPacks01.pkg"
  name "MAContent10_AssetPack_0873_IRsProducerPacks01"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0873_IRsProducerPacks01.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0873_IRsProducerPacks01.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0873_IRsProducerPacks01"
end
