cask "macontent10-assetpack-0545-exs-drumsgb" do
  version "b5d26d611b69fd0071906ef932b35426-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0545_EXS_DrumsGB.pkg"
  name "MAContent10_AssetPack_0545_EXS_DrumsGB"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0545_EXS_DrumsGB.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0545_EXS_DrumsGB.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0545_EXS_DrumsGB"
end
