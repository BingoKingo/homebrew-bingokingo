cask "macontent10-assetpack-0823-exs-electronicdrumkitssecretsauce" do
  version "94054e64b2e4d1aedacdf610bcb650f9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0823_EXS_ElectronicDrumkitsSecretSauce.pkg"
  name "MAContent10_AssetPack_0823_EXS_ElectronicDrumkitsSecretSauce"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0823_EXS_ElectronicDrumkitsSecretSauce.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0823_EXS_ElectronicDrumkitsSecretSauce.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0823_EXS_ElectronicDrumkitsSecretSauce"
end
