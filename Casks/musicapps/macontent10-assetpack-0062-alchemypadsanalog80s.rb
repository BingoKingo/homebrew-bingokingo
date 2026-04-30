cask "macontent10-assetpack-0062-alchemypadsanalog80s" do
  version "4327c3255c474d1bf7ca3da451630f6d-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0062_AlchemyPadsAnalog80s.pkg"
  name "MAContent10_AssetPack_0062_AlchemyPadsAnalog80s"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0062_AlchemyPadsAnalog80s.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0062_AlchemyPadsAnalog80s.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0062_AlchemyPadsAnalog80s"
end
