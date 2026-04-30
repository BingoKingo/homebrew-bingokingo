cask "macontent10-assetpack-0263-alchemyvovalssynthvocalsnaturechoir" do
  version "a66a49b67fa1f56a96b5d08188d1af21-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0263_AlchemyVovalsSynthVocalsNatureChoir.pkg"
  name "MAContent10_AssetPack_0263_AlchemyVovalsSynthVocalsNatureChoir"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0263_AlchemyVovalsSynthVocalsNatureChoir.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0263_AlchemyVovalsSynthVocalsNatureChoir.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0263_AlchemyVovalsSynthVocalsNatureChoir"
end
