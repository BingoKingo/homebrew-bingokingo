cask "macontent10-assetpack-0993-electronicdrummerroughriddim" do
  version "8b9d49cce4212453d5ddd54629d24da2-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0993_ElectronicDrummerRoughRiddim.pkg"
  name "MAContent10_AssetPack_0993_ElectronicDrummerRoughRiddim"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0993_ElectronicDrummerRoughRiddim.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0993_ElectronicDrummerRoughRiddim.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0993_ElectronicDrummerRoughRiddim"
end
