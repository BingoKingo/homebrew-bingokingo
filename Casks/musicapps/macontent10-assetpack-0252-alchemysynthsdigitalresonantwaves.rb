cask "macontent10-assetpack-0252-alchemysynthsdigitalresonantwaves" do
  version "4558c689198e6d45b1832e975d98c1d0-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0252_AlchemySynthsDigitalResonantWaves.pkg"
  name "MAContent10_AssetPack_0252_AlchemySynthsDigitalResonantWaves"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0252_AlchemySynthsDigitalResonantWaves.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0252_AlchemySynthsDigitalResonantWaves.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0252_AlchemySynthsDigitalResonantWaves"
end
