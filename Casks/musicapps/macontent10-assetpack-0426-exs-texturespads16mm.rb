cask "macontent10-assetpack-0426-exs-texturespads16mm" do
  version "c3fd3313ff4855a8430bc90e4b0048b5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0426_EXS_TexturesPads16mm.pkg"
  name "MAContent10_AssetPack_0426_EXS_TexturesPads16mm"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0426_EXS_TexturesPads16mm.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0426_EXS_TexturesPads16mm.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0426_EXS_TexturesPads16mm"
end
