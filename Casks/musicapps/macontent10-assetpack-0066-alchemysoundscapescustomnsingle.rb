cask "macontent10-assetpack-0066-alchemysoundscapescustomnsingle" do
  version "4eb8a6438ef50232120ef40df4eb090b-72"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0066_AlchemySoundscapesCustomNSingle.pkg"
  name "MAContent10_AssetPack_0066_AlchemySoundscapesCustomNSingle"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0066_AlchemySoundscapesCustomNSingle.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0066_AlchemySoundscapesCustomNSingle.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0066_AlchemySoundscapesCustomNSingle"
end
