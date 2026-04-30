cask "macontent10-assetpack-0196-alchemyguitarselectricpadroomhardhands" do
  version "87528bcb5171d877ed4dda6d3ccfc353-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0196_AlchemyGuitarsElectricPadRoomHardHands.pkg"
  name "MAContent10_AssetPack_0196_AlchemyGuitarsElectricPadRoomHardHands"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0196_AlchemyGuitarsElectricPadRoomHardHands.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0196_AlchemyGuitarsElectricPadRoomHardHands.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0196_AlchemyGuitarsElectricPadRoomHardHands"
end
