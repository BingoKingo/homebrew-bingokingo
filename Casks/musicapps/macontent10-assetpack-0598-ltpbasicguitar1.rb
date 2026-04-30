cask "macontent10-assetpack-0598-ltpbasicguitar1" do
  version "91da9766a66ef3e4a5b25243138eaa78-35"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0598_LTPBasicGuitar1.pkg"
  name "MAContent10_AssetPack_0598_LTPBasicGuitar1"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0598_LTPBasicGuitar1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0598_LTPBasicGuitar1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0598_LTPBasicGuitar1"
end
