cask "macontent10-assetpack-0547-exs-stringsgb" do
  version "1f78885a93a6f53e43d13298bb1cbf03-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0547_EXS_StringsGB.pkg"
  name "MAContent10_AssetPack_0547_EXS_StringsGB"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0547_EXS_StringsGB.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0547_EXS_StringsGB.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0547_EXS_StringsGB"
end
