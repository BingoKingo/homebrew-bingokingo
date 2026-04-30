cask "macontent10-assetpack-0717-exs-toyglockenspiel" do
  version "674deae476d287eccfb5834e63c7f060-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0717_EXS_ToyGlockenspiel.pkg"
  name "MAContent10_AssetPack_0717_EXS_ToyGlockenspiel"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0717_EXS_ToyGlockenspiel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0717_EXS_ToyGlockenspiel.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0717_EXS_ToyGlockenspiel"
end
