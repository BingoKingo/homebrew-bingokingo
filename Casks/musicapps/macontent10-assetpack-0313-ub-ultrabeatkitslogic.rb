cask "macontent10-assetpack-0313-ub-ultrabeatkitslogic" do
  version "dfb3d1b652bba13eed8a9845b81ec033-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0313_UB_UltrabeatKitsLogic.pkg"
  name "MAContent10_AssetPack_0313_UB_UltrabeatKitsLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0313_UB_UltrabeatKitsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0313_UB_UltrabeatKitsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0313_UB_UltrabeatKitsLogic"
end
