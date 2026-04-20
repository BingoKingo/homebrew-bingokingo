cask "0z695-0073-ben-folds-brick" do
  version "e855d960c3c5d67e657890a17ef9d581-88"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0073_Ben%20Folds_Brick.pkg"
  name "0Z695-0073_Ben Folds_Brick"
  desc "Ben Folds offers insights into his distinctive playing style while teaching the"
  homepage "https://audiocontentdownload.apple.com/ltp/en/brick.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0073_Ben%20Folds_Brick.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0073_Ben Folds_Brick.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0073_Ben Folds_Brick"
end
