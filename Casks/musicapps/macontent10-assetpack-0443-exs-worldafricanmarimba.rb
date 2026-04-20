cask "macontent10-assetpack-0443-exs-worldafricanmarimba" do
  version "e7677b7db5fcfc930f671cf3e72425a3-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0443_EXS_WorldAfricanMarimba.pkg"
  name "MAContent10_AssetPack_0443_EXS_WorldAfricanMarimba"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0443_EXS_WorldAfricanMarimba.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0443_EXS_WorldAfricanMarimba.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0443_EXS_WorldAfricanMarimba"
end
