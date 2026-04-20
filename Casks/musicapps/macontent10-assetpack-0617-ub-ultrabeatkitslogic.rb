cask "macontent10-assetpack-0617-ub-ultrabeatkitslogic" do
  version "6dc1a1ff27f205dc0354b9043c55f54d-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0617_UB_UltrabeatKitsLogic.pkg"
  name "MAContent10_AssetPack_0617_UB_UltrabeatKitsLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0617_UB_UltrabeatKitsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0617_UB_UltrabeatKitsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0617_UB_UltrabeatKitsLogic"
end
