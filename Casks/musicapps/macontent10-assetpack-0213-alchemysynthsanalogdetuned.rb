cask "macontent10-assetpack-0213-alchemysynthsanalogdetuned" do
  version "08bcf8cb0d114d8d3ead9c7e0573282f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0213_AlchemySynthsAnalogDetuned.pkg"
  name "MAContent10_AssetPack_0213_AlchemySynthsAnalogDetuned"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0213_AlchemySynthsAnalogDetuned.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0213_AlchemySynthsAnalogDetuned.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0213_AlchemySynthsAnalogDetuned"
end
