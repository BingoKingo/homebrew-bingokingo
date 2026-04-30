cask "macontent10-assetpack-0496-exs-orchperctubularbells" do
  version "2c61af7f424a2b2669a79645a002fabf-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0496_EXS_OrchPercTubularBells.pkg"
  name "MAContent10_AssetPack_0496_EXS_OrchPercTubularBells"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0496_EXS_OrchPercTubularBells.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0496_EXS_OrchPercTubularBells.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0496_EXS_OrchPercTubularBells"
end
