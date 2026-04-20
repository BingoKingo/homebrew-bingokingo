cask "macontent10-assetpack-0265-alchemyvovalssynthvocalshuman" do
  version "24a87ce5b97adc8d561294836aa41962-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0265_AlchemyVovalsSynthVocalsHuman.pkg"
  name "MAContent10_AssetPack_0265_AlchemyVovalsSynthVocalsHuman"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0265_AlchemyVovalsSynthVocalsHuman.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0265_AlchemyVovalsSynthVocalsHuman.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0265_AlchemyVovalsSynthVocalsHuman"
end
