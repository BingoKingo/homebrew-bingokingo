cask "macontent10-assetpack-0490-exs-orchwoodwindpiccolo" do
  version "06f3963ea07303242759f1fb20e4bcc3-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0490_EXS_OrchWoodwindPiccolo.pkg"
  name "MAContent10_AssetPack_0490_EXS_OrchWoodwindPiccolo"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0490_EXS_OrchWoodwindPiccolo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0490_EXS_OrchWoodwindPiccolo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0490_EXS_OrchWoodwindPiccolo"
end
