cask "macontent10-assetpack-0455-exs-worldcaribbeansteel" do
  version "7d161a676b13297e0fdd985a328d08f0-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0455_EXS_WorldCaribbeanSteel.pkg"
  name "MAContent10_AssetPack_0455_EXS_WorldCaribbeanSteel"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0455_EXS_WorldCaribbeanSteel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0455_EXS_WorldCaribbeanSteel.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0455_EXS_WorldCaribbeanSteel"
end
