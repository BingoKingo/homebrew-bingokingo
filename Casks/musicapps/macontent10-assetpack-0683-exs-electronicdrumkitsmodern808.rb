cask "macontent10-assetpack-0683-exs-electronicdrumkitsmodern808" do
  version "2a304101b85fe80d049dc6da1ff75204"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0683_EXS_ElectronicDrumkitsModern808.pkg"
  name "MAContent10_AssetPack_0683_EXS_ElectronicDrumkitsModern808"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0683_EXS_ElectronicDrumkitsModern808.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0683_EXS_ElectronicDrumkitsModern808.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0683_EXS_ElectronicDrumkitsModern808"
end
