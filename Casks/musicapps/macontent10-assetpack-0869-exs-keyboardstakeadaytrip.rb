cask "macontent10-assetpack-0869-exs-keyboardstakeadaytrip" do
  version "e97338e2b51b76586534fb6a392f13fd-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0869_EXS_KeyboardsTakeADaytrip.pkg"
  name "MAContent10_AssetPack_0869_EXS_KeyboardsTakeADaytrip"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0869_EXS_KeyboardsTakeADaytrip.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0869_EXS_KeyboardsTakeADaytrip.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0869_EXS_KeyboardsTakeADaytrip"
end
