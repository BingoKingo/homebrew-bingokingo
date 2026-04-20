cask "macontent10-assetpack-0203-alchemysynthsanalogpolyphonic" do
  version "bbd78ce7ed5e62d5db919247938c85c4-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0203_AlchemySynthsAnalogPolyphonic.pkg"
  name "MAContent10_AssetPack_0203_AlchemySynthsAnalogPolyphonic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0203_AlchemySynthsAnalogPolyphonic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0203_AlchemySynthsAnalogPolyphonic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0203_AlchemySynthsAnalogPolyphonic"
end
