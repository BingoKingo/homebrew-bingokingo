cask "macontent10-assetpack-0369-exs-malletsglassmarimbasoft" do
  version "35f8d96080017da291eddb2985ac9f5b-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0369_EXS_MalletsGlassMarimbaSoft.pkg"
  name "MAContent10_AssetPack_0369_EXS_MalletsGlassMarimbaSoft"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0369_EXS_MalletsGlassMarimbaSoft.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0369_EXS_MalletsGlassMarimbaSoft.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0369_EXS_MalletsGlassMarimbaSoft"
end
