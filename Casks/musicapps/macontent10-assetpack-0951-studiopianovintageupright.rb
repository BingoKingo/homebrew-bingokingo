cask "macontent10-assetpack-0951-studiopianovintageupright" do
  version "35a64028f649e1fc62fd5be126ad2006-139"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0951_StudioPianoVintageUpright.pkg"
  name "MAContent10_AssetPack_0951_StudioPianoVintageUpright"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0951_StudioPianoVintageUpright.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0951_StudioPianoVintageUpright.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0951_StudioPianoVintageUpright"
end
