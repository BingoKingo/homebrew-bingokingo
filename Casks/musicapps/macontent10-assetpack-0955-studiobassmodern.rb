cask "macontent10-assetpack-0955-studiobassmodern" do
  version "e2c032865fd50006d8231a41e972e526-113"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0955_StudioBassModern.pkg"
  name "MAContent10_AssetPack_0955_StudioBassModern"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0955_StudioBassModern.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0955_StudioBassModern.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0955_StudioBassModern"
end
