cask "macontent10-assetpack-0360-exs-basselectricliverpool" do
  version "c5b8711dd43e8847bd90d1e383c90067-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0360_EXS_BassElectricLiverpool.pkg"
  name "MAContent10_AssetPack_0360_EXS_BassElectricLiverpool"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0360_EXS_BassElectricLiverpool.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0360_EXS_BassElectricLiverpool.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0360_EXS_BassElectricLiverpool"
end
