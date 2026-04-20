cask "macontent10-assetpack-0466-exs-worldeuroaccordion" do
  version "7718832d2501a924dfd224aff5b381fb-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0466_EXS_WorldEuroAccordion.pkg"
  name "MAContent10_AssetPack_0466_EXS_WorldEuroAccordion"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0466_EXS_WorldEuroAccordion.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0466_EXS_WorldEuroAccordion.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0466_EXS_WorldEuroAccordion"
end
