cask "macontent10-assetpack-0223-alchemysynthsanalogmocha" do
  version "5fbb44d47020e15b10ede6044695e6b7-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0223_AlchemySynthsAnalogMocha.pkg"
  name "MAContent10_AssetPack_0223_AlchemySynthsAnalogMocha"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0223_AlchemySynthsAnalogMocha.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0223_AlchemySynthsAnalogMocha.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0223_AlchemySynthsAnalogMocha"
end
