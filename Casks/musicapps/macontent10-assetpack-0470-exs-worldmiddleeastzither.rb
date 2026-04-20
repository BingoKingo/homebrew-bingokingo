cask "macontent10-assetpack-0470-exs-worldmiddleeastzither" do
  version "d14677126b3ce389d091b3910a5e8de1-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0470_EXS_WorldMiddleEastZither.pkg"
  name "MAContent10_AssetPack_0470_EXS_WorldMiddleEastZither"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0470_EXS_WorldMiddleEastZither.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0470_EXS_WorldMiddleEastZither.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0470_EXS_WorldMiddleEastZither"
end
