cask "macontent10-assetpack-0954-studiobasssession" do
  version "a54707e82c8f430ceee156aa0c9f8b59-172"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0954_StudioBassSession.pkg"
  name "MAContent10_AssetPack_0954_StudioBassSession"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0954_StudioBassSession.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0954_StudioBassSession.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0954_StudioBassSession"
end
