cask "macontent10-assetpack-0452-exs-worldasianjapaneseflute" do
  version "219647f47e4148ad1557cafebdecf984-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0452_EXS_WorldAsianJapaneseFlute.pkg"
  name "MAContent10_AssetPack_0452_EXS_WorldAsianJapaneseFlute"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0452_EXS_WorldAsianJapaneseFlute.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0452_EXS_WorldAsianJapaneseFlute.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0452_EXS_WorldAsianJapaneseFlute"
end
