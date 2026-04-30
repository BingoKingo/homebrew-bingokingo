cask "macontent10-assetpack-0691-irsinstrumentprofiles" do
  version "bf7bffa26d6db5469eea0c80fc60ef6e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0691_IRsInstrumentProfiles.pkg"
  name "MAContent10_AssetPack_0691_IRsInstrumentProfiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0691_IRsInstrumentProfiles.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0691_IRsInstrumentProfiles.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0691_IRsInstrumentProfiles"
end
