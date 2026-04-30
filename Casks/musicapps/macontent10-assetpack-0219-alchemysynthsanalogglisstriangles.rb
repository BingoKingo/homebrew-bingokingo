cask "macontent10-assetpack-0219-alchemysynthsanalogglisstriangles" do
  version "8757ff07db5d32e04f44148099af54c7-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0219_AlchemySynthsAnalogGlissTriangles.pkg"
  name "MAContent10_AssetPack_0219_AlchemySynthsAnalogGlissTriangles"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0219_AlchemySynthsAnalogGlissTriangles.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0219_AlchemySynthsAnalogGlissTriangles.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0219_AlchemySynthsAnalogGlissTriangles"
end
