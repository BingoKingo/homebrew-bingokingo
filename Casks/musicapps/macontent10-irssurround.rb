cask "macontent10-irssurround" do
  version "eaf03930e36e296c3eca75470b4a3752-61"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_IRsSurround.pkg"
  name "IRsSurroundPackage"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_IRsSurround.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_IRsSurround.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_IRsSurround"
end
