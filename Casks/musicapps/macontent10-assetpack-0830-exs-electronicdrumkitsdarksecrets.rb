cask "macontent10-assetpack-0830-exs-electronicdrumkitsdarksecrets" do
  version "520ea29e62a7d8b018dfea0190c23e5e-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0830_EXS_ElectronicDrumkitsDarkSecrets.pkg"
  name "MAContent10_AssetPack_0830_EXS_ElectronicDrumkitsDarkSecrets"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0830_EXS_ElectronicDrumkitsDarkSecrets.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0830_EXS_ElectronicDrumkitsDarkSecrets.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0830_EXS_ElectronicDrumkitsDarkSecrets"
end
