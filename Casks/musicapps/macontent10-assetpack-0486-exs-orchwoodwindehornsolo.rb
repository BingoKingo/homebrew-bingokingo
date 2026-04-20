cask "macontent10-assetpack-0486-exs-orchwoodwindehornsolo" do
  version "ab95c17c7ffe6ce8c8f694a46e8ca215-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0486_EXS_OrchWoodwindEHornSolo.pkg"
  name "MAContent10_AssetPack_0486_EXS_OrchWoodwindEHornSolo"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0486_EXS_OrchWoodwindEHornSolo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0486_EXS_OrchWoodwindEHornSolo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0486_EXS_OrchWoodwindEHornSolo"
end
