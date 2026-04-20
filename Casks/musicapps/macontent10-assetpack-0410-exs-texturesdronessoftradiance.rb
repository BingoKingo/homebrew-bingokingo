cask "macontent10-assetpack-0410-exs-texturesdronessoftradiance" do
  version "5670934a8299ea22fb4a59cb5ea0b40c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0410_EXS_TexturesDronesSoftRadiance.pkg"
  name "MAContent10_AssetPack_0410_EXS_TexturesDronesSoftRadiance"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0410_EXS_TexturesDronesSoftRadiance.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0410_EXS_TexturesDronesSoftRadiance.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0410_EXS_TexturesDronesSoftRadiance"
end
