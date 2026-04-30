cask "macontent10-assetpack-0433-exs-texturespadsmomentum" do
  version "09a06ad16566a2c56bbf6acdbc6824bb"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0433_EXS_TexturesPadsMomentum.pkg"
  name "MAContent10_AssetPack_0433_EXS_TexturesPadsMomentum"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0433_EXS_TexturesPadsMomentum.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0433_EXS_TexturesPadsMomentum.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0433_EXS_TexturesPadsMomentum"
end
