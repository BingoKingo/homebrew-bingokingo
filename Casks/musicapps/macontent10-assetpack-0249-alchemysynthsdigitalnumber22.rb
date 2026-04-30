cask "macontent10-assetpack-0249-alchemysynthsdigitalnumber22" do
  version "5213be8c3bb3ce8e76e074d7b5136d41-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0249_AlchemySynthsDigitalNumber22.pkg"
  name "MAContent10_AssetPack_0249_AlchemySynthsDigitalNumber22"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0249_AlchemySynthsDigitalNumber22.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0249_AlchemySynthsDigitalNumber22.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0249_AlchemySynthsDigitalNumber22"
end
