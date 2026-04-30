cask "macontent10-assetpack-0648-percussionist" do
  version "a9f4352453ec883b809ecfa2a792d0b4-27"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0648_Percussionist.pkg"
  name "MAContent10_AssetPack_0648_Percussionist"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0648_Percussionist.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0648_Percussionist.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0648_Percussionist"
end
