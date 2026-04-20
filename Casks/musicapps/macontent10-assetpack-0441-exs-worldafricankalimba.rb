cask "macontent10-assetpack-0441-exs-worldafricankalimba" do
  version "2340ed227b292127eebfdea4e051b891-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0441_EXS_WorldAfricanKalimba.pkg"
  name "MAContent10_AssetPack_0441_EXS_WorldAfricanKalimba"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0441_EXS_WorldAfricanKalimba.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0441_EXS_WorldAfricanKalimba.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0441_EXS_WorldAfricanKalimba"
end
