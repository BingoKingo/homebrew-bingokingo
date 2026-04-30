cask "macontent10-assetpack-0480-exs-worldsouthasiasitar" do
  version "043276809d99d11beba7eacc0cf651e5-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0480_EXS_WorldSouthAsiaSitar.pkg"
  name "MAContent10_AssetPack_0480_EXS_WorldSouthAsiaSitar"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0480_EXS_WorldSouthAsiaSitar.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0480_EXS_WorldSouthAsiaSitar.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0480_EXS_WorldSouthAsiaSitar"
end
