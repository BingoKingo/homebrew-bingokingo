cask "0z695-0200-rush-working-man" do
  version "7fcdfa9f04afe215af787a34e0d9d857-151"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0200_Rush_Working%20Man.pkg"
  name "0Z695-0200_Rush_Working Man"
  desc "Alex Lifeson teaches you how to play this early Rush classic by starting with th"
  homepage "https://audiocontentdownload.apple.com/ltp/en/workingman.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0200_Rush_Working%20Man.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0200_Rush_Working Man.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0200_Rush_Working Man"
end
