cask "macontent10-assetpack-0284-alchemyvocalssolovocalssustainamanda" do
  version "95ff8d4ebb2fbdf971eb81222f8a4361-26"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0284_AlchemyVocalsSoloVocalsSustainAmanda.pkg"
  name "MAContent10_AssetPack_0284_AlchemyVocalsSoloVocalsSustainAmanda"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0284_AlchemyVocalsSoloVocalsSustainAmanda.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0284_AlchemyVocalsSoloVocalsSustainAmanda.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0284_AlchemyVocalsSoloVocalsSustainAmanda"
end
