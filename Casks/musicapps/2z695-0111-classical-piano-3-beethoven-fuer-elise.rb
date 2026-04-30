cask "2z695-0111-classical-piano-3-beethoven-fuer-elise" do
  version "4db4150a65f97b4aacac727070ebbd97-51"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0111_Classical%20Piano%203_Beethoven%20Fuer%20Elise.pkg"
  name "2Z695-0111_Classical Piano 3_Beethoven Fuer Elise"
  desc "Ludwig van Beethoven"
  homepage "https://audiocontentdownload.apple.com/ltp/en/classicalpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0111_Classical%20Piano%203_Beethoven%20Fuer%20Elise.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0111_Classical Piano 3_Beethoven Fuer Elise.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0111_Classical Piano 3_Beethoven Fuer Elise"
end
