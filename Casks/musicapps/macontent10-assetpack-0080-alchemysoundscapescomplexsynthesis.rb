cask "macontent10-assetpack-0080-alchemysoundscapescomplexsynthesis" do
  version "842c2457435e4e7b18c26e17d1a0b7f5-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0080_AlchemySoundscapesComplexSynthesis.pkg"
  name "MAContent10_AssetPack_0080_AlchemySoundscapesComplexSynthesis"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0080_AlchemySoundscapesComplexSynthesis.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0080_AlchemySoundscapesComplexSynthesis.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0080_AlchemySoundscapesComplexSynthesis"
end
