cask "macontent10-assetpack-0245-alchemysynthsdigitalfroghop" do
  version "187b6509812f1c9c89a4fe3a63319dd2-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0245_AlchemySynthsDigitalFrogHop.pkg"
  name "MAContent10_AssetPack_0245_AlchemySynthsDigitalFrogHop"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0245_AlchemySynthsDigitalFrogHop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0245_AlchemySynthsDigitalFrogHop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0245_AlchemySynthsDigitalFrogHop"
end
