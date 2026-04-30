cask "macontent10-assetpack-0141-alchemyguitarspluckeddulimar" do
  version "9c51345bec74c5519bbd192efd559483"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0141_AlchemyGuitarsPluckedDulimar.pkg"
  name "MAContent10_AssetPack_0141_AlchemyGuitarsPluckedDulimar"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0141_AlchemyGuitarsPluckedDulimar.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0141_AlchemyGuitarsPluckedDulimar.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0141_AlchemyGuitarsPluckedDulimar"
end
