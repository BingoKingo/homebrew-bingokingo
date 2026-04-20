cask "macontent10-assetpack-0799-qs-basic" do
  version "7fab7b460a7a7a6afca43bad6056e84c-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0799_QS_Basic.pkg"
  name "MAContent10_AssetPack_0799_QS_Basic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0799_QS_Basic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0799_QS_Basic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0799_QS_Basic"
end
