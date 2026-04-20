cask "macontent10-assetpack-0603-exs-worlderhu" do
  version "9ad470dd40242412c493667f9002876a-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0603_EXS_WorldErhu.pkg"
  name "MAContent10_AssetPack_0603_EXS_WorldErhu"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0603_EXS_WorldErhu.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0603_EXS_WorldErhu.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0603_EXS_WorldErhu"
end
