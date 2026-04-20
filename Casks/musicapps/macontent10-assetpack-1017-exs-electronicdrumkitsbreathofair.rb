cask "macontent10-assetpack-1017-exs-electronicdrumkitsbreathofair" do
  version "568aaa96ec7baec8c65d54cd0ef1085c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1017_EXS_ElectronicDrumkitsBreathOfAir.pkg"
  name "MAContent10_AssetPack_1017_EXS_ElectronicDrumkitsBreathOfAir"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1017_EXS_ElectronicDrumkitsBreathOfAir.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1017_EXS_ElectronicDrumkitsBreathOfAir.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1017_EXS_ElectronicDrumkitsBreathOfAir"
end
