cask "macontent10-assetpack-0503-exs-choirchamberclassical" do
  version "4f5b0ff6d3514620e5be6c6701d15153-32"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0503_EXS_ChoirChamberClassical.pkg"
  name "MAContent10_AssetPack_0503_EXS_ChoirChamberClassical"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0503_EXS_ChoirChamberClassical.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0503_EXS_ChoirChamberClassical.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0503_EXS_ChoirChamberClassical"
end
