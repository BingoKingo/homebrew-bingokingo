cask "macontent10-assetpack-0429-exs-texturespadsdiscovery" do
  version "32d59b364c2b902ecb3c88c1c7d317c3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0429_EXS_TexturesPadsDiscovery.pkg"
  name "MAContent10_AssetPack_0429_EXS_TexturesPadsDiscovery"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0429_EXS_TexturesPadsDiscovery.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0429_EXS_TexturesPadsDiscovery.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0429_EXS_TexturesPadsDiscovery"
end
