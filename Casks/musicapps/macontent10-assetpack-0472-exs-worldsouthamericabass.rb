cask "macontent10-assetpack-0472-exs-worldsouthamericabass" do
  version "74ef57bc0e252be70ef409c20e56da6d-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0472_EXS_WorldSouthAmericaBass.pkg"
  name "MAContent10_AssetPack_0472_EXS_WorldSouthAmericaBass"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0472_EXS_WorldSouthAmericaBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0472_EXS_WorldSouthAmericaBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0472_EXS_WorldSouthAmericaBass"
end
