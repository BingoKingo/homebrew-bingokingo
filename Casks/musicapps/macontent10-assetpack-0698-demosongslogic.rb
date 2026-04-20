cask "macontent10-assetpack-0698-demosongslogic" do
  version "6e54f78947dccf978fa819a515ea8017-58"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0698_DemosongsLogic.pkg"
  name "MAContent10_AssetPack_0698_DemosongsLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0698_DemosongsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0698_DemosongsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0698_DemosongsLogic"
end
