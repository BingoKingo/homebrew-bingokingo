cask "macontent10-assetpack-0008-alchemykeysacoustic" do
  version "a3550ea0a5953b5d950d8802b729da61-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0008_AlchemyKeysAcoustic.pkg"
  name "MAContent10_AssetPack_0008_AlchemyKeysAcoustic"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0008_AlchemyKeysAcoustic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0008_AlchemyKeysAcoustic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0008_AlchemyKeysAcoustic"
end
