cask "macontent10-assetpack-0543-demosongslogic" do
  version "5956187cd3b33330bc0b2c3c9b296d7c-22"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0543_DemosongsLogic.pkg"
  name "MAContent10_AssetPack_0543_DemosongsLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0543_DemosongsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0543_DemosongsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0543_DemosongsLogic"
end
