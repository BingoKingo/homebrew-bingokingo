cask "macontent10-assetpack-0495-exs-orchperctimpani" do
  version "e630ed4f62830cd45f9c328fa982cec3-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0495_EXS_OrchPercTimpani.pkg"
  name "MAContent10_AssetPack_0495_EXS_OrchPercTimpani"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0495_EXS_OrchPercTimpani.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0495_EXS_OrchPercTimpani.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0495_EXS_OrchPercTimpani"
end
