cask "0z695-0069-sarah-mclachlan-angel" do
  version "8396cbb9b9b6a61dfb46c9271c649c08-34"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0069_Sarah%20McLachlan_Angel.pkg"
  name "0Z695-0069_Sarah McLachlan_Angel"
  desc "Sarah McLachlan teaches you the basic chords to her famous ballad “Angel”. After"
  homepage "https://audiocontentdownload.apple.com/ltp/en/angel.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0069_Sarah%20McLachlan_Angel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0069_Sarah McLachlan_Angel.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0069_Sarah McLachlan_Angel"
end
