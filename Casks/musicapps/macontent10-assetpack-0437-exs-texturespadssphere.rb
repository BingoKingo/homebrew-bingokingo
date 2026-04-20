cask "macontent10-assetpack-0437-exs-texturespadssphere" do
  version "eca94a336f584c2c8a89b87d9a57cbcc"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0437_EXS_TexturesPadsSphere.pkg"
  name "MAContent10_AssetPack_0437_EXS_TexturesPadsSphere"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0437_EXS_TexturesPadsSphere.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0437_EXS_TexturesPadsSphere.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0437_EXS_TexturesPadsSphere"
end
