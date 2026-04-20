cask "macontent10-assetpack-0435-exs-texturespadsoverblown" do
  version "59c902466879fe7d0255dbf50d17f29c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0435_EXS_TexturesPadsOverblown.pkg"
  name "MAContent10_AssetPack_0435_EXS_TexturesPadsOverblown"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0435_EXS_TexturesPadsOverblown.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0435_EXS_TexturesPadsOverblown.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0435_EXS_TexturesPadsOverblown"
end
