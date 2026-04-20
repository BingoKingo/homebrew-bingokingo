cask "macontent10-assetpack-0752-exs-electronicdrumkitsmoderndisco" do
  version "65e8adf2f617b109a4e5c3259f4f02a9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0752_EXS_ElectronicDrumkitsModernDisco.pkg"
  name "MAContent10_AssetPack_0752_EXS_ElectronicDrumkitsModernDisco"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0752_EXS_ElectronicDrumkitsModernDisco.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0752_EXS_ElectronicDrumkitsModernDisco.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0752_EXS_ElectronicDrumkitsModernDisco"
end
