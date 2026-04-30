cask "macontent10-assetpack-0215-alchemysynthsanalogdualtriangles" do
  version "9a526720ee61c9db87243c41c670810d-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0215_AlchemySynthsAnalogDualTriangles.pkg"
  name "MAContent10_AssetPack_0215_AlchemySynthsAnalogDualTriangles"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0215_AlchemySynthsAnalogDualTriangles.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0215_AlchemySynthsAnalogDualTriangles.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0215_AlchemySynthsAnalogDualTriangles"
end
