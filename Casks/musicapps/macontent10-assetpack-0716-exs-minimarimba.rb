cask "macontent10-assetpack-0716-exs-minimarimba" do
  version "f5eea8e47cca23ac193fa61ac5495498"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0716_EXS_MiniMarimba.pkg"
  name "MAContent10_AssetPack_0716_EXS_MiniMarimba"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0716_EXS_MiniMarimba.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0716_EXS_MiniMarimba.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0716_EXS_MiniMarimba"
end
