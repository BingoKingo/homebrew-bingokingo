cask "macontent10-assetpack-0354-exs-pianosteinway" do
  version "223a006d805d49686b5a96d0a637d899-18"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0354_EXS_PianoSteinway.pkg"
  name "MAContent10_AssetPack_0354_EXS_PianoSteinway"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0354_EXS_PianoSteinway.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0354_EXS_PianoSteinway.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0354_EXS_PianoSteinway"
end
