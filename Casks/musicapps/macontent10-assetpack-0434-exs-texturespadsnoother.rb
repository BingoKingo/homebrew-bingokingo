cask "macontent10-assetpack-0434-exs-texturespadsnoother" do
  version "f5cff4ff94aacaeaab0074cb3654f96b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0434_EXS_TexturesPadsNoOther.pkg"
  name "MAContent10_AssetPack_0434_EXS_TexturesPadsNoOther"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0434_EXS_TexturesPadsNoOther.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0434_EXS_TexturesPadsNoOther.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0434_EXS_TexturesPadsNoOther"
end
