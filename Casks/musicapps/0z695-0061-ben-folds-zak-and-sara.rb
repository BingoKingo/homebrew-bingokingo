cask "0z695-0061-ben-folds-zak-and-sara" do
  version "ddde393e1deb50da42473ad816050b73-85"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0061_Ben%20Folds_Zak%20and%20Sara.pkg"
  name "0Z695-0061_Ben Folds_Zak and Sara"
  desc "In this song, Ben Folds shows you how to play in his high-powered piano style. A"
  homepage "https://audiocontentdownload.apple.com/ltp/en/zakandsara.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0061_Ben%20Folds_Zak%20and%20Sara.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0061_Ben Folds_Zak and Sara.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0061_Ben Folds_Zak and Sara"
end
