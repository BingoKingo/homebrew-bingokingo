cask "macontent10-assetpack-0436-exs-texturespadsovertone" do
  version "60c0b23d636322679da748773f940a91"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0436_EXS_TexturesPadsOvertone.pkg"
  name "MAContent10_AssetPack_0436_EXS_TexturesPadsOvertone"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0436_EXS_TexturesPadsOvertone.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0436_EXS_TexturesPadsOvertone.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0436_EXS_TexturesPadsOvertone"
end
