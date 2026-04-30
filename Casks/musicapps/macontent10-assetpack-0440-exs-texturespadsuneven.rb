cask "macontent10-assetpack-0440-exs-texturespadsuneven" do
  version "3b24c056f9951b44ed275994ef2e0115"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0440_EXS_TexturesPadsUneven.pkg"
  name "MAContent10_AssetPack_0440_EXS_TexturesPadsUneven"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0440_EXS_TexturesPadsUneven.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0440_EXS_TexturesPadsUneven.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0440_EXS_TexturesPadsUneven"
end
