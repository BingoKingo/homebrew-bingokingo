cask "0z695-0077-death-cab-for-cutie-i-will-follow-you-into-the-dark" do
  version "fb47965466c9aa81558ed5a626f6d9af-35"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0077_Death%20Cab%20for%20Cutie_I%20Will%20Follow%20You%20Into%20The%20Dark.pkg"
  name "0Z695-0077_Death Cab for Cutie_I Will Follow You Into The Dark"
  desc "Ben Gibbard from Death Cab For Cutie, teaches the solo acoustic guitar part for"
  homepage "https://audiocontentdownload.apple.com/ltp/en/iwillfollowyou.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0077_Death%20Cab%20for%20Cutie_I%20Will%20Follow%20You%20Into%20The%20Dark.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0077_Death Cab for Cutie_I Will Follow You Into The Dark.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0077_Death Cab for Cutie_I Will Follow You Into The Dark"
end
