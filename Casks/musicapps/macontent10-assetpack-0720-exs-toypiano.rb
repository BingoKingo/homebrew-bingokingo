cask "macontent10-assetpack-0720-exs-toypiano" do
  version "d42d5e4e89e452e0d316b8d528888870-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0720_EXS_ToyPiano.pkg"
  name "MAContent10_AssetPack_0720_EXS_ToyPiano"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0720_EXS_ToyPiano.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0720_EXS_ToyPiano.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0720_EXS_ToyPiano"
end
