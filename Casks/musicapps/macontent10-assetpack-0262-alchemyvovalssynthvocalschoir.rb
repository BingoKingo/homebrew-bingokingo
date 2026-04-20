cask "macontent10-assetpack-0262-alchemyvovalssynthvocalschoir" do
  version "84f1e58387a2696c148fb52c130eca4c-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0262_AlchemyVovalsSynthVocalsChoir.pkg"
  name "MAContent10_AssetPack_0262_AlchemyVovalsSynthVocalsChoir"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0262_AlchemyVovalsSynthVocalsChoir.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0262_AlchemyVovalsSynthVocalsChoir.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0262_AlchemyVovalsSynthVocalsChoir"
end
