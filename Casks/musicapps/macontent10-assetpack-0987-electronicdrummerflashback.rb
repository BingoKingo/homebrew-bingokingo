cask "macontent10-assetpack-0987-electronicdrummerflashback" do
  version "0a6e240d18e579852b1b009ba02eb2d3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0987_ElectronicDrummerFlashback.pkg"
  name "MAContent10_AssetPack_0987_ElectronicDrummerFlashback"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0987_ElectronicDrummerFlashback.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0987_ElectronicDrummerFlashback.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0987_ElectronicDrummerFlashback"
end
