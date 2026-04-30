cask "macontent10-assetpack-0407-exs-texturesdronesradiowaves" do
  version "16b407caf3a56dead820b8ba0bd4a42d-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0407_EXS_TexturesDronesRadioWaves.pkg"
  name "MAContent10_AssetPack_0407_EXS_TexturesDronesRadioWaves"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0407_EXS_TexturesDronesRadioWaves.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0407_EXS_TexturesDronesRadioWaves.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0407_EXS_TexturesDronesRadioWaves"
end
