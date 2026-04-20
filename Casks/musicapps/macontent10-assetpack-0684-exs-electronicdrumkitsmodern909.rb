cask "macontent10-assetpack-0684-exs-electronicdrumkitsmodern909" do
  version "d7c5c042d4a02ba69d95e87e63ff56f4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0684_EXS_ElectronicDrumkitsModern909.pkg"
  name "MAContent10_AssetPack_0684_EXS_ElectronicDrumkitsModern909"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0684_EXS_ElectronicDrumkitsModern909.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0684_EXS_ElectronicDrumkitsModern909.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0684_EXS_ElectronicDrumkitsModern909"
end
