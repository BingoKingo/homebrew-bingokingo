cask "0z695-0060-america-ventura-highway" do
  version "754258f93b25e1ae30dcbc171c6af0ee-125"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0060_America_Ventura%20Highway.pkg"
  name "0Z695-0060_America_Ventura Highway"
  desc "Dewey Bunnell and Gerry Beckley from the band America teach the guitar parts for"
  homepage "https://audiocontentdownload.apple.com/ltp/en/venturahighway.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0060_America_Ventura%20Highway.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0060_America_Ventura Highway.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0060_America_Ventura Highway"
end
