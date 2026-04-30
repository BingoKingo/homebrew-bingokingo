cask "macontent10-assetpack-0929-alchemysamplessmplalch01" do
  version "9ace116631668d05dae1b178cad420bb-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0929_AlchemySamplesSmplAlch01.pkg"
  name "MAContent10_AssetPack_0929_AlchemySamplesSmplAlch01"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0929_AlchemySamplesSmplAlch01.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0929_AlchemySamplesSmplAlch01.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0929_AlchemySamplesSmplAlch01"
end
