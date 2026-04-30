cask "macontent10-assetpack-0445-exs-worldasiankit" do
  version "34e5e205220888382be59915891da9de-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0445_EXS_WorldAsianKit.pkg"
  name "MAContent10_AssetPack_0445_EXS_WorldAsianKit"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0445_EXS_WorldAsianKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0445_EXS_WorldAsianKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0445_EXS_WorldAsianKit"
end
