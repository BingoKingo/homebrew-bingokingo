cask "macontent10-assetpack-0356-exs-bassacousticuprightballad" do
  version "5893f360291b25b7cb4d953706cdd11c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0356_EXS_BassAcousticUprightBallad.pkg"
  name "MAContent10_AssetPack_0356_EXS_BassAcousticUprightBallad"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0356_EXS_BassAcousticUprightBallad.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0356_EXS_BassAcousticUprightBallad.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0356_EXS_BassAcousticUprightBallad"
end
