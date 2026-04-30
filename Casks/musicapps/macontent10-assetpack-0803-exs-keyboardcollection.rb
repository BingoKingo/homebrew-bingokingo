cask "macontent10-assetpack-0803-exs-keyboardcollection" do
  version "159225497a46d60f152392f4ac38e353-13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0803_EXS_KeyboardCollection.pkg"
  name "MAContent10_AssetPack_0803_EXS_KeyboardCollection"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0803_EXS_KeyboardCollection.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0803_EXS_KeyboardCollection.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0803_EXS_KeyboardCollection"
end
