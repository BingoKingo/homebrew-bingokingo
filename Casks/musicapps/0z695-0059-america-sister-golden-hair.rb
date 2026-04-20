cask "0z695-0059-america-sister-golden-hair" do
  version "0254a2dca8a0b273d1c0a455c4f5d00c-78"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0059_America_Sister%20Golden%20Hair.pkg"
  name "0Z695-0059_America_Sister Golden Hair"
  desc "Gerry Beckley from the band America shows you how to play their classic song, Si"
  homepage "https://audiocontentdownload.apple.com/ltp/en/sistergoldenhair.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0059_America_Sister%20Golden%20Hair.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0059_America_Sister Golden Hair.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0059_America_Sister Golden Hair"
end
