cask "macontent10-assetpack-0355-exs-pianogrand" do
  version "70f7947f79875e1e731b3b2b610ede98-61"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0355_EXS_PianoGrand.pkg"
  name "MAContent10_AssetPack_0355_EXS_PianoGrand"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0355_EXS_PianoGrand.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0355_EXS_PianoGrand.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0355_EXS_PianoGrand"
end
