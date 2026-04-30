cask "macontent10-assetpack-0664-drummervintagerods" do
  version "75a3b614f4de344630076f8529de2744-84"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0664_DrummerVintageRods.pkg"
  name "MAContent10_AssetPack_0664_DrummerVintageRods"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0664_DrummerVintageRods.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0664_DrummerVintageRods.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0664_DrummerVintageRods"
end
