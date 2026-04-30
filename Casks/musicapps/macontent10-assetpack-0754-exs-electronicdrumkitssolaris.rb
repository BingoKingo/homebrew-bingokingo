cask "macontent10-assetpack-0754-exs-electronicdrumkitssolaris" do
  version "72f39042f8fe6f8245f93cba1d6589fd"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0754_EXS_ElectronicDrumkitsSolaris.pkg"
  name "MAContent10_AssetPack_0754_EXS_ElectronicDrumkitsSolaris"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0754_EXS_ElectronicDrumkitsSolaris.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0754_EXS_ElectronicDrumkitsSolaris.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0754_EXS_ElectronicDrumkitsSolaris"
end
