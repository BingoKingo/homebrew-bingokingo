cask "macontent10-assetpack-0694-exs-studiohornssections" do
  version "6a22e8e140949fe40b5e8a1d76b2f050-296"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0694_EXS_StudioHornsSections.pkg"
  name "MAContent10_AssetPack_0694_EXS_StudioHornsSections"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0694_EXS_StudioHornsSections.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0694_EXS_StudioHornsSections.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0694_EXS_StudioHornsSections"
end
