cask "macontent10-assetpack-0723-exs-toymelodica" do
  version "35ba1294a16b911cca724cd3e6455a19"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0723_EXS_ToyMelodica.pkg"
  name "MAContent10_AssetPack_0723_EXS_ToyMelodica"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0723_EXS_ToyMelodica.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0723_EXS_ToyMelodica.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0723_EXS_ToyMelodica"
end
