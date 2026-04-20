cask "macontent10-assetpack-0368-exs-malletsglassmarimbamuted" do
  version "1dd4e5e0344113a6c575e3f93972fb95-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0368_EXS_MalletsGlassMarimbaMuted.pkg"
  name "MAContent10_AssetPack_0368_EXS_MalletsGlassMarimbaMuted"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0368_EXS_MalletsGlassMarimbaMuted.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0368_EXS_MalletsGlassMarimbaMuted.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0368_EXS_MalletsGlassMarimbaMuted"
end
