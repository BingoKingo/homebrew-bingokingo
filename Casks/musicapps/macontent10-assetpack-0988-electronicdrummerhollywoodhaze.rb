cask "macontent10-assetpack-0988-electronicdrummerhollywoodhaze" do
  version "8cbb1287dc784433aca5ad63ede9943c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0988_ElectronicDrummerHollywoodHaze.pkg"
  name "MAContent10_AssetPack_0988_ElectronicDrummerHollywoodHaze"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0988_ElectronicDrummerHollywoodHaze.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0988_ElectronicDrummerHollywoodHaze.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0988_ElectronicDrummerHollywoodHaze"
end
