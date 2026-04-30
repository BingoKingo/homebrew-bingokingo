cask "macontent10-assetpack-0339-irslargespaceswarped" do
  version "e65b0c87521c194efed9db9300c0fc8c-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0339_IRsLargeSpacesWarped.pkg"
  name "MAContent10_AssetPack_0339_IRsLargeSpacesWarped"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0339_IRsLargeSpacesWarped.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0339_IRsLargeSpacesWarped.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0339_IRsLargeSpacesWarped"
end
