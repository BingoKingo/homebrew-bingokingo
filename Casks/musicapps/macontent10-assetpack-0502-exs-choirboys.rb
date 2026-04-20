cask "macontent10-assetpack-0502-exs-choirboys" do
  version "2ff321cb3e413ab899afdab2177c05e5-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0502_EXS_ChoirBoys.pkg"
  name "MAContent10_AssetPack_0502_EXS_ChoirBoys"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0502_EXS_ChoirBoys.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0502_EXS_ChoirBoys.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0502_EXS_ChoirBoys"
end
