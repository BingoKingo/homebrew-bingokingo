cask "macontent10-assetpack-0050-alchemypadsdigitaldustworldsweep" do
  version "ad7355ab6d7d1fb0cfc3110b08c4bfef-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0050_AlchemyPadsDigitalDustWorldSweep.pkg"
  name "MAContent10_AssetPack_0050_AlchemyPadsDigitalDustWorldSweep"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0050_AlchemyPadsDigitalDustWorldSweep.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0050_AlchemyPadsDigitalDustWorldSweep.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0050_AlchemyPadsDigitalDustWorldSweep"
end
