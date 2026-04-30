cask "macontent10-assetpack-0432-exs-texturespadslightpillars" do
  version "5cf3f8e72af929f6079af7cffa7cbee1"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0432_EXS_TexturesPadsLightPillars.pkg"
  name "MAContent10_AssetPack_0432_EXS_TexturesPadsLightPillars"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0432_EXS_TexturesPadsLightPillars.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0432_EXS_TexturesPadsLightPillars.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0432_EXS_TexturesPadsLightPillars"
end
