cask "2z695-0110-classical-piano-2-bach-musette" do
  version "b41d0c8c9a65058c7edd203c4e3eb119-54"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0110_Classical%20Piano%202_Bach%20Musette.pkg"
  name "2Z695-0110_Classical Piano 2_Bach Musette"
  desc "Johann Sebastian Bach"
  homepage "https://audiocontentdownload.apple.com/ltp/en/classicalpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0110_Classical%20Piano%202_Bach%20Musette.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0110_Classical Piano 2_Bach Musette.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0110_Classical Piano 2_Bach Musette"
end
