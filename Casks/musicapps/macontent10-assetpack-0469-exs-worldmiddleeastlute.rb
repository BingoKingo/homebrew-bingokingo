cask "macontent10-assetpack-0469-exs-worldmiddleeastlute" do
  version "064b4f0d2f93d8fd8da11f273d2941cc-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0469_EXS_WorldMiddleEastLute.pkg"
  name "MAContent10_AssetPack_0469_EXS_WorldMiddleEastLute"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0469_EXS_WorldMiddleEastLute.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0469_EXS_WorldMiddleEastLute.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0469_EXS_WorldMiddleEastLute"
end
