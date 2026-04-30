cask "macontent10-assetpack-0688-exs-worldtaikodrums" do
  version "df5f0f7e2a703e98bea802ccd6950cd9-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0688_EXS_WorldTaikoDrums.pkg"
  name "MAContent10_AssetPack_0688_EXS_WorldTaikoDrums"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0688_EXS_WorldTaikoDrums.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0688_EXS_WorldTaikoDrums.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0688_EXS_WorldTaikoDrums"
end
