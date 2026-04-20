cask "macontent10-logic9legacy" do
  version "4c9d08a4a85a01a6b6b707bee1bf6ee8-304"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_Logic9Legacy.pkg"
  name "Logic9LegacyContentPackage"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_Logic9Legacy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_Logic9Legacy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_Logic9Legacy"
end
