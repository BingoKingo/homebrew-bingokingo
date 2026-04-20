cask "macontent10-assetpack-1001-exs-electronicdrumkitspompomlunarbumps" do
  version "de9401c3bb07104dcf0bb383e5339ae2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1001_EXS_ElectronicDrumkitsPomPomLunarBumps.pkg"
  name "MAContent10_AssetPack_1001_EXS_ElectronicDrumkitsPomPomLunarBumps"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1001_EXS_ElectronicDrumkitsPomPomLunarBumps.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1001_EXS_ElectronicDrumkitsPomPomLunarBumps.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1001_EXS_ElectronicDrumkitsPomPomLunarBumps"
end
