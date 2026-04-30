cask "0z695-0072-one-republic-apologize" do
  version "89eaa9f35e52b25bd8857d2394c778d5-97"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0072_One%20Republic_Apologize.pkg"
  name "0Z695-0072_One Republic_Apologize"
  desc "Lead singer, pianist and songwriter Ryan Tedder of OneRepublic teaches you the c"
  homepage "https://audiocontentdownload.apple.com/ltp/en/apologize.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0072_One%20Republic_Apologize.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0072_One Republic_Apologize.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0072_One Republic_Apologize"
end
