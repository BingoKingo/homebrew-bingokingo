cask "ml-apc0003-marklettieri" do
  version "e95a02691965cf54444d8a865fb040a7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_apc0003_marklettieri/ml_apc0003_marklettieri.aar"
  name "MarkLettieri"
  desc "ProducerPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_apc0003_marklettieri/ml_apc0003_marklettieri.aar"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  preflight do
    require "fileutils"
    target_dir = File.expand_path("~/Music/Logic Pro Library.bundle")
    FileUtils.mkdir_p(target_dir)
    system "aa", "extract", "-i", File.join(staged_path, "ml_apc0003_marklettieri.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Apple Loops/Mark Lettieri",
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_apc0003_marklettieri.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Live Loop Grids/Mark Lettieri.logicx",
  ]
end
