cask "macontent10-assetpack-0451-exs-worldasianjapanesekoto" do
  version "99b7711f3cfd3fa6f4fbd54587f035a7-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0451_EXS_WorldAsianJapaneseKoto.pkg"
  name "MAContent10_AssetPack_0451_EXS_WorldAsianJapaneseKoto"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0451_EXS_WorldAsianJapaneseKoto.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0451_EXS_WorldAsianJapaneseKoto.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0451_EXS_WorldAsianJapaneseKoto"
end
