cask "macontent10-assetpack-0377-exs-mellotron" do
  version "df850e635fb908b1743c3c5d1bb79430-29"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0377_EXS_Mellotron.pkg"
  name "MAContent10_AssetPack_0377_EXS_Mellotron"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0377_EXS_Mellotron.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0377_EXS_Mellotron.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0377_EXS_Mellotron"
end
