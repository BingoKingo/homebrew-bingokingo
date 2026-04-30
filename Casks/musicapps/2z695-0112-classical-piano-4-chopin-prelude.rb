cask "2z695-0112-classical-piano-4-chopin-prelude" do
  version "65a06b027f533d803fe3b4b3199604ed-68"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0112_Classical%20Piano%204_Chopin%20Prelude.pkg"
  name "2Z695-0112_Classical Piano 4_Chopin Prelude"
  desc "Frédéric Chopin"
  homepage "https://audiocontentdownload.apple.com/ltp/en/classicalpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0112_Classical%20Piano%204_Chopin%20Prelude.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0112_Classical Piano 4_Chopin Prelude.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0112_Classical Piano 4_Chopin Prelude"
end
