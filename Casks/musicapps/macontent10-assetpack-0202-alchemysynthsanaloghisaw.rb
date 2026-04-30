cask "macontent10-assetpack-0202-alchemysynthsanaloghisaw" do
  version "7ee73cd0c79f2a15c7c2fad5188f64f5-22"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0202_AlchemySynthsAnalogHiSaw.pkg"
  name "MAContent10_AssetPack_0202_AlchemySynthsAnalogHiSaw"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0202_AlchemySynthsAnalogHiSaw.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0202_AlchemySynthsAnalogHiSaw.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0202_AlchemySynthsAnalogHiSaw"
end
