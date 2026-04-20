cask "macontent10-appleloopslegacyremix" do
  version "e6883530b5be901a1982e1bffdc04399-50"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacyRemix.pkg"
  name "JamPackRemixToolsAppleLoopsPackage"
  desc "ContainsAppleLoops, MissingDownloadOnly, NeverUpdateLegacy"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacyRemix.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AppleLoopsLegacyRemix.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AppleLoopsLegacyRemix"
end
