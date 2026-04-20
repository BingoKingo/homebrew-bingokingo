cask "macontent10-assetpack-0367-exs-malletsglassmarimbahard" do
  version "dc7206579a4296ba8c076e3204f398f4-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0367_EXS_MalletsGlassMarimbaHard.pkg"
  name "MAContent10_AssetPack_0367_EXS_MalletsGlassMarimbaHard"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0367_EXS_MalletsGlassMarimbaHard.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0367_EXS_MalletsGlassMarimbaHard.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0367_EXS_MalletsGlassMarimbaHard"
end
