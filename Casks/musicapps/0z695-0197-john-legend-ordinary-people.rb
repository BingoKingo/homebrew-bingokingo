cask "0z695-0197-john-legend-ordinary-people" do
  version "ab42b5ee59c8a2a1708038a539b58e00-68"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0197_John%20Legend_Ordinary%20People.pkg"
  name "0Z695-0197_John Legend_Ordinary People"
  desc "Using just three chords, John Legend guides you through a simple version of his"
  homepage "https://audiocontentdownload.apple.com/ltp/en/ordinarypeople.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0197_John%20Legend_Ordinary%20People.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0197_John Legend_Ordinary People.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0197_John Legend_Ordinary People"
end
