cask "macontent10-assetpack-1004-exs-keyboardspompom" do
  version "30f1b4d3a4289c1fd2a51078699160e1"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1004_EXS_KeyboardsPomPom.pkg"
  name "MAContent10_AssetPack_1004_EXS_KeyboardsPomPom"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1004_EXS_KeyboardsPomPom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1004_EXS_KeyboardsPomPom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1004_EXS_KeyboardsPomPom"
end
