cask "macontent10-assetpack-0449-exs-worldasianchineseguitar" do
  version "bb3b60968a473ba5b31aa727ee69f2fc-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0449_EXS_WorldAsianChineseGuitar.pkg"
  name "MAContent10_AssetPack_0449_EXS_WorldAsianChineseGuitar"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0449_EXS_WorldAsianChineseGuitar.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0449_EXS_WorldAsianChineseGuitar.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0449_EXS_WorldAsianChineseGuitar"
end
