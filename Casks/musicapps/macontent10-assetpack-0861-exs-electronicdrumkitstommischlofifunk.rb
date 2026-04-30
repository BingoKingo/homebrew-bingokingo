cask "macontent10-assetpack-0861-exs-electronicdrumkitstommischlofifunk" do
  version "56d7dfa2bd0bedbdef4cb55684645064"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0861_EXS_ElectronicDrumkitsTomMischLoFiFunk.pkg"
  name "MAContent10_AssetPack_0861_EXS_ElectronicDrumkitsTomMischLoFiFunk"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0861_EXS_ElectronicDrumkitsTomMischLoFiFunk.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0861_EXS_ElectronicDrumkitsTomMischLoFiFunk.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0861_EXS_ElectronicDrumkitsTomMischLoFiFunk"
end
