cask "macontent10-assetpack-0364-exs-basselectricstinger" do
  version "06fd6e81eaac501b5388576ff1e273f0-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0364_EXS_BassElectricStinger.pkg"
  name "MAContent10_AssetPack_0364_EXS_BassElectricStinger"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0364_EXS_BassElectricStinger.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0364_EXS_BassElectricStinger.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0364_EXS_BassElectricStinger"
end
