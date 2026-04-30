cask "0z695-0063-colbie-caillat-bubbly" do
  version "ca37aa88f88bcd136a373ceab1040c57-59"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0063_Colbie%20Caillat_Bubbly.pkg"
  name "0Z695-0063_Colbie Caillat_Bubbly"
  desc "Colbie Caillat shows you how to play her song Bubbly using a capo and open tunin"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bubbly.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0063_Colbie%20Caillat_Bubbly.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0063_Colbie Caillat_Bubbly.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0063_Colbie Caillat_Bubbly"
end
