cask "macontent10-assetpack-0501-exs-orchorgan" do
  version "1df8d8878a2910ca35f88a873679840e-39"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0501_EXS_OrchOrgan.pkg"
  name "MAContent10_AssetPack_0501_EXS_OrchOrgan"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0501_EXS_OrchOrgan.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0501_EXS_OrchOrgan.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0501_EXS_OrchOrgan"
end
