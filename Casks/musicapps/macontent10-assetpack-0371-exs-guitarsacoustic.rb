cask "macontent10-assetpack-0371-exs-guitarsacoustic" do
  version "4bd85e4002b15bd478798c9db41e4b08-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0371_EXS_GuitarsAcoustic.pkg"
  name "MAContent10_AssetPack_0371_EXS_GuitarsAcoustic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0371_EXS_GuitarsAcoustic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0371_EXS_GuitarsAcoustic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0371_EXS_GuitarsAcoustic"
end
