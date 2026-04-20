cask "0z695-0068-sara-bareilles-love-song" do
  version "6769c6044c745852dc45a71837a8ca92-53"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0068_Sara%20Bareilles_Love%20Song.pkg"
  name "0Z695-0068_Sara Bareilles_Love Song"
  desc "Singer/songwriter Sara Bareilles guides you through her smash hit, Love Song, on"
  homepage "https://audiocontentdownload.apple.com/ltp/en/lovesong.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0068_Sara%20Bareilles_Love%20Song.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0068_Sara Bareilles_Love Song.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0068_Sara Bareilles_Love Song"
end
