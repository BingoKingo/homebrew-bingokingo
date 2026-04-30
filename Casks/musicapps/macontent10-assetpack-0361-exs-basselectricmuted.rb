cask "macontent10-assetpack-0361-exs-basselectricmuted" do
  version "721ca89b9dea14f109762fc761a2677d-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0361_EXS_BassElectricMuted.pkg"
  name "MAContent10_AssetPack_0361_EXS_BassElectricMuted"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0361_EXS_BassElectricMuted.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0361_EXS_BassElectricMuted.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0361_EXS_BassElectricMuted"
end
