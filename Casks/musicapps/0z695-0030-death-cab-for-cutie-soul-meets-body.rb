cask "0z695-0030-death-cab-for-cutie-soul-meets-body" do
  version "09fffb2dcd78030456c24bcb82bf3a10-87"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0030_Death%20Cab%20for%20Cutie_Soul%20Meets%20Body.pkg"
  name "0Z695-0030_Death Cab for Cutie_Soul Meets Body"
  desc "Ben Gibbard shows you a simplified and advanced way to play this well-known Deat"
  homepage "https://audiocontentdownload.apple.com/ltp/en/soulmeetsbody.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0030_Death%20Cab%20for%20Cutie_Soul%20Meets%20Body.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0030_Death Cab for Cutie_Soul Meets Body.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0030_Death Cab for Cutie_Soul Meets Body"
end
