cask "macontent10-assetpack-0243-alchemysynthsdigitaldistortedsonarbm" do
  version "5491d36693634286851134656178f812"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0243_AlchemySynthsDigitalDistortedSonarbM.pkg"
  name "MAContent10_AssetPack_0243_AlchemySynthsDigitalDistortedSonarbM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0243_AlchemySynthsDigitalDistortedSonarbM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0243_AlchemySynthsDigitalDistortedSonarbM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0243_AlchemySynthsDigitalDistortedSonarbM"
end
