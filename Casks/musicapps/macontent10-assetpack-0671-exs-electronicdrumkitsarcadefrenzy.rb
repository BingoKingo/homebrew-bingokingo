cask "macontent10-assetpack-0671-exs-electronicdrumkitsarcadefrenzy" do
  version "a7c07690dd76fe209aa51983697493e4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0671_EXS_ElectronicDrumkitsArcadeFrenzy.pkg"
  name "MAContent10_AssetPack_0671_EXS_ElectronicDrumkitsArcadeFrenzy"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0671_EXS_ElectronicDrumkitsArcadeFrenzy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0671_EXS_ElectronicDrumkitsArcadeFrenzy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0671_EXS_ElectronicDrumkitsArcadeFrenzy"
end
