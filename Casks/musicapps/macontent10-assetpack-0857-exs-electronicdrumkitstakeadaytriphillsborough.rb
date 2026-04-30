cask "macontent10-assetpack-0857-exs-electronicdrumkitstakeadaytriphillsborough" do
  version "1ef6faa8e2de2fbc33e43108c15a5e84"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0857_EXS_ElectronicDrumkitsTakeADaytripHillsborough.pkg"
  name "MAContent10_AssetPack_0857_EXS_ElectronicDrumkitsTakeADaytripHillsborough"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0857_EXS_ElectronicDrumkitsTakeADaytripHillsborough.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0857_EXS_ElectronicDrumkitsTakeADaytripHillsborough.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0857_EXS_ElectronicDrumkitsTakeADaytripHillsborough"
end
