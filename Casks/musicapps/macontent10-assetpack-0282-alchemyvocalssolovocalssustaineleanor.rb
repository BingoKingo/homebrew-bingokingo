cask "macontent10-assetpack-0282-alchemyvocalssolovocalssustaineleanor" do
  version "078f106b6fa0d774412d2d1fe0630d6f-40"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0282_AlchemyVocalsSoloVocalsSustainEleanor.pkg"
  name "MAContent10_AssetPack_0282_AlchemyVocalsSoloVocalsSustainEleanor"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0282_AlchemyVocalsSoloVocalsSustainEleanor.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0282_AlchemyVocalsSoloVocalsSustainEleanor.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0282_AlchemyVocalsSoloVocalsSustainEleanor"
end
