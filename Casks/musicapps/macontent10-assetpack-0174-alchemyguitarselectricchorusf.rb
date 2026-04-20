cask "macontent10-assetpack-0174-alchemyguitarselectricchorusf" do
  version "1b719ec3b7c2faf570773eda3dfc3bf2-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0174_AlchemyGuitarsElectricChorusf.pkg"
  name "MAContent10_AssetPack_0174_AlchemyGuitarsElectricChorusf"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0174_AlchemyGuitarsElectricChorusf.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0174_AlchemyGuitarsElectricChorusf.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0174_AlchemyGuitarsElectricChorusf"
end
