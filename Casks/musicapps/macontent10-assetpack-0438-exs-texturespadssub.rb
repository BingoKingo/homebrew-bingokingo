cask "macontent10-assetpack-0438-exs-texturespadssub" do
  version "206bef6274802132e768c5f711f48a0e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0438_EXS_TexturesPadsSub.pkg"
  name "MAContent10_AssetPack_0438_EXS_TexturesPadsSub"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0438_EXS_TexturesPadsSub.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0438_EXS_TexturesPadsSub.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0438_EXS_TexturesPadsSub"
end
