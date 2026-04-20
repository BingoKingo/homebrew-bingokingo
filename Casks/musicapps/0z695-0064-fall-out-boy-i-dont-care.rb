cask "0z695-0064-fall-out-boy-i-dont-care" do
  version "5fc4d385962741b6acc77b52ec2b7e96-66"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0064_Fall%20Out%20Boy_I%20Don%27t%20Care.pkg"
  name "0Z695-0064_Fall Out Boy_I Don't Care"
  desc "Lead singer, guitarist and songwriter Patrick Stump of Fall Out Boy teaches you"
  homepage "https://audiocontentdownload.apple.com/ltp/en/idontcare.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0064_Fall%20Out%20Boy_I%20Don%27t%20Care.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0064_Fall Out Boy_I Don't Care.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0064_Fall Out Boy_I Don't Care"
end
