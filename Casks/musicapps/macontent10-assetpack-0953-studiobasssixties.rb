cask "macontent10-assetpack-0953-studiobasssixties" do
  version "16673b371f40fe6c0e09047138f69f20-128"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0953_StudioBassSixties.pkg"
  name "MAContent10_AssetPack_0953_StudioBassSixties"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0953_StudioBassSixties.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0953_StudioBassSixties.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0953_StudioBassSixties"
end
