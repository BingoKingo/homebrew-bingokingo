cask "macontent10-assetpack-0673-exs-electronicdrumkitscompact" do
  version "6f550881bf7661e62a5b371c3fea9e7d-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0673_EXS_ElectronicDrumkitsCompact.pkg"
  name "MAContent10_AssetPack_0673_EXS_ElectronicDrumkitsCompact"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0673_EXS_ElectronicDrumkitsCompact.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0673_EXS_ElectronicDrumkitsCompact.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0673_EXS_ElectronicDrumkitsCompact"
end
