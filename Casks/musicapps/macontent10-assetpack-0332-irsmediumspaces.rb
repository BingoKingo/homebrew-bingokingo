cask "macontent10-assetpack-0332-irsmediumspaces" do
  version "00db9dfd37f7981541678f170de600b6-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0332_IRsMediumSpaces.pkg"
  name "MAContent10_AssetPack_0332_IRsMediumSpaces"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0332_IRsMediumSpaces.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0332_IRsMediumSpaces.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0332_IRsMediumSpaces"
end
