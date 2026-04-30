cask "0z695-0198-death-cab-for-cutie-i-will-possess-your-heart" do
  version "d84971888266176d4c088c736e2b5f1d-67"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0198_Death%20Cab%20for%20Cutie_I%20Will%20Possess%20Your%20Heart.pkg"
  name "0Z695-0198_Death Cab for Cutie_I Will Possess Your Heart"
  desc "Death Cab for Cutie singer and songwriter Ben Gibbard shows you a simplified ver"
  homepage "https://audiocontentdownload.apple.com/ltp/en/iwillpossessyourheart.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0198_Death%20Cab%20for%20Cutie_I%20Will%20Possess%20Your%20Heart.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0198_Death Cab for Cutie_I Will Possess Your Heart.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0198_Death Cab for Cutie_I Will Possess Your Heart"
end
