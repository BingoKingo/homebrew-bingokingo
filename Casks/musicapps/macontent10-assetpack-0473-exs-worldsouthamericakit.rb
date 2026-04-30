cask "macontent10-assetpack-0473-exs-worldsouthamericakit" do
  version "c472fb8e49e8ced786f24721f7be7407-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0473_EXS_WorldSouthAmericaKit.pkg"
  name "MAContent10_AssetPack_0473_EXS_WorldSouthAmericaKit"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0473_EXS_WorldSouthAmericaKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0473_EXS_WorldSouthAmericaKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0473_EXS_WorldSouthAmericaKit"
end
