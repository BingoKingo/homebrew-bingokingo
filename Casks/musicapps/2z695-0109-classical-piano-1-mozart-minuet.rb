cask "2z695-0109-classical-piano-1-mozart-minuet" do
  version "c5216f4bb737d408c7f4b675e886ee68-60"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0109_Classical%20Piano%201_Mozart%20Minuet.pkg"
  name "2Z695-0109_Classical Piano 1_Mozart Minuet"
  desc "Minuet in F Major (Easy)"
  homepage "https://audiocontentdownload.apple.com/ltp/en/classicalpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0109_Classical%20Piano%201_Mozart%20Minuet.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0109_Classical Piano 1_Mozart Minuet.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0109_Classical Piano 1_Mozart Minuet"
end
