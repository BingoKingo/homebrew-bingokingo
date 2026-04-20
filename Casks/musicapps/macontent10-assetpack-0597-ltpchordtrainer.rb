cask "macontent10-assetpack-0597-ltpchordtrainer" do
  version "897ed6cecaed9a5c33e42a539788fe6e-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0597_LTPChordTrainer.pkg"
  name "MAContent10_AssetPack_0597_LTPChordTrainer"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0597_LTPChordTrainer.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0597_LTPChordTrainer.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0597_LTPChordTrainer"
end
