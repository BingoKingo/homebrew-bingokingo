cask "macontent10-garageband6legacy" do
  version "fa63e23a774c752e1b0e6b1e76751a17-143"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_GarageBand6Legacy.pkg"
  name "GarageBand11ExtraContentPackage"
  desc "ContainsAppleLoops, ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_GarageBand6Legacy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_GarageBand6Legacy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_GarageBand6Legacy"
end
