cask "macontent10-assetpack-0745-alchemybasshouse" do
  version "3521b03a925bf4816cc163c20c3e429b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0745_AlchemyBassHouse.pkg"
  name "MAContent10_AssetPack_0745_AlchemyBassHouse"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0745_AlchemyBassHouse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0745_AlchemyBassHouse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0745_AlchemyBassHouse"
end
