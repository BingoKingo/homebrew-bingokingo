cask "macontent10-assetpack-0474-exs-worldsouthamericaguitarron" do
  version "adb32c10da943c86d3bb3a4872654439-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0474_EXS_WorldSouthAmericaGuitarron.pkg"
  name "MAContent10_AssetPack_0474_EXS_WorldSouthAmericaGuitarron"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0474_EXS_WorldSouthAmericaGuitarron.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0474_EXS_WorldSouthAmericaGuitarron.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0474_EXS_WorldSouthAmericaGuitarron"
end
