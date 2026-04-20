cask "macontent10-assetpack-0847-exs-electronicdrumkitsoakfelderhitsynth" do
  version "d9de69793259883d21d3625a1a9093e4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0847_EXS_ElectronicDrumkitsOakFelderHitSynth.pkg"
  name "MAContent10_AssetPack_0847_EXS_ElectronicDrumkitsOakFelderHitSynth"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0847_EXS_ElectronicDrumkitsOakFelderHitSynth.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0847_EXS_ElectronicDrumkitsOakFelderHitSynth.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0847_EXS_ElectronicDrumkitsOakFelderHitSynth"
end
