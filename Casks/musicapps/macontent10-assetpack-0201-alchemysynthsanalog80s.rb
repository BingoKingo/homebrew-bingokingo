cask "macontent10-assetpack-0201-alchemysynthsanalog80s" do
  version "a1f577b89a8dd4bb57cf7290e3dbf41a-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0201_AlchemySynthsAnalog80s.pkg"
  name "MAContent10_AssetPack_0201_AlchemySynthsAnalog80s"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0201_AlchemySynthsAnalog80s.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0201_AlchemySynthsAnalog80s.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0201_AlchemySynthsAnalog80s"
end
