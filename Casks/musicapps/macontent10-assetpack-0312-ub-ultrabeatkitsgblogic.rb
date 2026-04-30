cask "macontent10-assetpack-0312-ub-ultrabeatkitsgblogic" do
  version "95e395b906dfe9858f7c27a865b262de-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0312_UB_UltrabeatKitsGBLogic.pkg"
  name "MAContent10_AssetPack_0312_UB_UltrabeatKitsGBLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0312_UB_UltrabeatKitsGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0312_UB_UltrabeatKitsGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0312_UB_UltrabeatKitsGBLogic"
end
