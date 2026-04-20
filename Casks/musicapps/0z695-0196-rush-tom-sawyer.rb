cask "0z695-0196-rush-tom-sawyer" do
  version "d8568833a6f63908978d6312a8395e7e-72"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0196_Rush_Tom%20Sawyer.pkg"
  name "0Z695-0196_Rush_Tom Sawyer"
  desc "Alex Lifeson first shows you a simple way to play the intro riff of this iconic"
  homepage "https://audiocontentdownload.apple.com/ltp/en/tomsawyer.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0196_Rush_Tom%20Sawyer.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0196_Rush_Tom Sawyer.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0196_Rush_Tom Sawyer"
end
