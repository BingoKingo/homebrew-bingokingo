cask "macontent10-assetpack-0719-exs-toycelesta" do
  version "9c0f2ec5a728134954600e0b2b2e5f9b-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0719_EXS_ToyCelesta.pkg"
  name "MAContent10_AssetPack_0719_EXS_ToyCelesta"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0719_EXS_ToyCelesta.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0719_EXS_ToyCelesta.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0719_EXS_ToyCelesta"
end
