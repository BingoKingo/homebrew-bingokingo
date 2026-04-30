cask "macontent10-assetpack-0300-alchemyvovalssynthvocalsvocoder" do
  version "4a617c4cb4066b9885b4ac5271a2907a-16"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0300_AlchemyVovalsSynthVocalsVocoder.pkg"
  name "MAContent10_AssetPack_0300_AlchemyVovalsSynthVocalsVocoder"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0300_AlchemyVovalsSynthVocalsVocoder.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0300_AlchemyVovalsSynthVocalsVocoder.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0300_AlchemyVovalsSynthVocalsVocoder"
end
