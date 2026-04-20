cask "macontent10-assetpack-0837-alchemybacklightbounce" do
  version "d359b7cf81717d014e4e479d5e1e3ba5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0837_AlchemyBacklightBounce.pkg"
  name "MAContent10_AssetPack_0837_AlchemyBacklightBounce"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0837_AlchemyBacklightBounce.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0837_AlchemyBacklightBounce.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0837_AlchemyBacklightBounce"
end
