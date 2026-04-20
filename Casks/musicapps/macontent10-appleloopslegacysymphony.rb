cask "macontent10-appleloopslegacysymphony" do
  version "f1a566c4918fd55959c0109eb6f3e3ab-79"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacySymphony.pkg"
  name "JamPackSymphonyOrchestraAppleLoopsPackage"
  desc "ContainsAppleLoops, MissingDownloadOnly, NeverUpdateLegacy"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacySymphony.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AppleLoopsLegacySymphony.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AppleLoopsLegacySymphony"
end
