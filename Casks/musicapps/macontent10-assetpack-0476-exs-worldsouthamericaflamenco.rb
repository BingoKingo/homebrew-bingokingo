cask "macontent10-assetpack-0476-exs-worldsouthamericaflamenco" do
  version "c44c84a00b15a6553811ac1ac5fe7fa5-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0476_EXS_WorldSouthAmericaFlamenco.pkg"
  name "MAContent10_AssetPack_0476_EXS_WorldSouthAmericaFlamenco"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0476_EXS_WorldSouthAmericaFlamenco.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0476_EXS_WorldSouthAmericaFlamenco.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0476_EXS_WorldSouthAmericaFlamenco"
end
