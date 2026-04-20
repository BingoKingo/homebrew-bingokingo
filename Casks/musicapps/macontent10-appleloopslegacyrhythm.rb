cask "macontent10-appleloopslegacyrhythm" do
  version "2085cc5e42b51bd83998e27a803475c8-46"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacyRhythm.pkg"
  name "JamPackRhythmSectionAppleLoopsPackage"
  desc "ContainsAppleLoops, MissingDownloadOnly, NeverUpdateLegacy"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacyRhythm.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AppleLoopsLegacyRhythm.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AppleLoopsLegacyRhythm"
end
