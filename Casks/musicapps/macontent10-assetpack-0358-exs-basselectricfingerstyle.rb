cask "macontent10-assetpack-0358-exs-basselectricfingerstyle" do
  version "ad7ddae4ba76b56348196a3772aedff6-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0358_EXS_BassElectricFingerStyle.pkg"
  name "MAContent10_AssetPack_0358_EXS_BassElectricFingerStyle"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0358_EXS_BassElectricFingerStyle.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0358_EXS_BassElectricFingerStyle.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0358_EXS_BassElectricFingerStyle"
end
