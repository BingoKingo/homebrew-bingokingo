cask "macontent10-assetpack-0898-exs-electronicdrumkitsanalogblaze" do
  version "d6072e212f0b20c8cfb590dcf876da1b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0898_EXS_ElectronicDrumkitsAnalogBlaze.pkg"
  name "MAContent10_AssetPack_0898_EXS_ElectronicDrumkitsAnalogBlaze"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0898_EXS_ElectronicDrumkitsAnalogBlaze.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0898_EXS_ElectronicDrumkitsAnalogBlaze.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0898_EXS_ElectronicDrumkitsAnalogBlaze"
end
