cask "0z695-0076-squeeze-pulling-mussels" do
  version "590b91ed85d9c374155aa20ce62ea391-106"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0076_Squeeze_Pulling%20Mussels.pkg"
  name "0Z695-0076_Squeeze_Pulling Mussels"
  desc "Squeeze lead vocal and guitarist Glenn Tilbrook shows you how to play, Pulling M"
  homepage "https://audiocontentdownload.apple.com/ltp/en/pullingmussels.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0076_Squeeze_Pulling%20Mussels.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0076_Squeeze_Pulling Mussels.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0076_Squeeze_Pulling Mussels"
end
