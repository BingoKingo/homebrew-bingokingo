cask "z-america-horse-with-no-name" do
  version "dea6ceaf8fe0fb5411557913558973d8-95"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/z_America_Horse%20With%20No%20Name.pkg"
  name "z_America_Horse With No Name"
  desc "Dewey Bunnell and Gerry Beckley from the band America teach the simplified and a"
  homepage "https://audiocontentdownload.apple.com/ltp/en/horsewithnoname.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/z_America_Horse%20With%20No%20Name.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "z_America_Horse With No Name.pkg"

  uninstall pkgutil: "com.apple.pkg.z_America_Horse With No Name"
end
