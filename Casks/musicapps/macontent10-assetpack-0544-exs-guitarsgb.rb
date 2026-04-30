cask "macontent10-assetpack-0544-exs-guitarsgb" do
  version "dbd5976f826deec77be3e4fb007a9dbb-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0544_EXS_GuitarsGB.pkg"
  name "MAContent10_AssetPack_0544_EXS_GuitarsGB"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0544_EXS_GuitarsGB.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0544_EXS_GuitarsGB.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0544_EXS_GuitarsGB"
end
