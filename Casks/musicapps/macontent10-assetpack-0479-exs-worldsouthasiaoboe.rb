cask "macontent10-assetpack-0479-exs-worldsouthasiaoboe" do
  version "e8122144c1b028e4a98e6fd839fad3cd-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0479_EXS_WorldSouthAsiaOboe.pkg"
  name "MAContent10_AssetPack_0479_EXS_WorldSouthAsiaOboe"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0479_EXS_WorldSouthAsiaOboe.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0479_EXS_WorldSouthAsiaOboe.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0479_EXS_WorldSouthAsiaOboe"
end
