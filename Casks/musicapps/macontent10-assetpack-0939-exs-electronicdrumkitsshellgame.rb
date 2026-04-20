cask "macontent10-assetpack-0939-exs-electronicdrumkitsshellgame" do
  version "8df84d10fe5aef670329cc6bb05a4fba"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0939_EXS_ElectronicDrumkitsShellGame.pkg"
  name "MAContent10_AssetPack_0939_EXS_ElectronicDrumkitsShellGame"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0939_EXS_ElectronicDrumkitsShellGame.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0939_EXS_ElectronicDrumkitsShellGame.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0939_EXS_ElectronicDrumkitsShellGame"
end
