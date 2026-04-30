cask "macontent10-assetpack-0427-exs-texturespadsbillow" do
  version "d8982d6092ace19a5927f3c13a857dba"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0427_EXS_TexturesPadsBillow.pkg"
  name "MAContent10_AssetPack_0427_EXS_TexturesPadsBillow"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0427_EXS_TexturesPadsBillow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0427_EXS_TexturesPadsBillow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0427_EXS_TexturesPadsBillow"
end
