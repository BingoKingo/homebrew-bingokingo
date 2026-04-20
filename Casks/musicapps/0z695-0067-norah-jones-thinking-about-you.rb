cask "0z695-0067-norah-jones-thinking-about-you" do
  version "1da007bd41fdc6c54001291b3b2f7191-45"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0067_Norah%20Jones_Thinking%20About%20You.pkg"
  name "0Z695-0067_Norah Jones_Thinking About You"
  desc "Norah Jones explains some of her signature playing techniques, introduces soloin"
  homepage "https://audiocontentdownload.apple.com/ltp/en/thinkingaboutyou.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0067_Norah%20Jones_Thinking%20About%20You.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0067_Norah Jones_Thinking About You.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0067_Norah Jones_Thinking About You"
end
