cask "macontent10-assetpack-0889-demosonglogicmontero" do
  version "95476857df0f4a081f7fccb97e9f262a-29"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0889_DemosongLogicMontero.pkg"
  name "MAContent10_AssetPack_0889_DemosongLogicMontero"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0889_DemosongLogicMontero.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0889_DemosongLogicMontero.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0889_DemosongLogicMontero"
end
