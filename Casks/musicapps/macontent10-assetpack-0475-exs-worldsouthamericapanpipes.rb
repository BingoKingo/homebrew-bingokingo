cask "macontent10-assetpack-0475-exs-worldsouthamericapanpipes" do
  version "2112c5078ce22bac017bb8efbb7ebb6a-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0475_EXS_WorldSouthAmericaPanpipes.pkg"
  name "MAContent10_AssetPack_0475_EXS_WorldSouthAmericaPanpipes"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0475_EXS_WorldSouthAmericaPanpipes.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0475_EXS_WorldSouthAmericaPanpipes.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0475_EXS_WorldSouthAmericaPanpipes"
end
