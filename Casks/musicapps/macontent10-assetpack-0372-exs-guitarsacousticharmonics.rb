cask "macontent10-assetpack-0372-exs-guitarsacousticharmonics" do
  version "b89756af13492951caa3284d072a23f6-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0372_EXS_GuitarsAcousticHarmonics.pkg"
  name "MAContent10_AssetPack_0372_EXS_GuitarsAcousticHarmonics"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0372_EXS_GuitarsAcousticHarmonics.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0372_EXS_GuitarsAcousticHarmonics.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0372_EXS_GuitarsAcousticHarmonics"
end
