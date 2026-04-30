cask "ml-0040-vocalloops" do
  version "b0488af0110dbbc94ddb6a889ba66be1"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0040_vocalloops/ml_0040_vocalloops.aar"
  name "VoxMelodics"
  desc "VocalPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0040_vocalloops/ml_0040_vocalloops.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0040_vocalloops.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vox Melodics",
    "～/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0040_vocalloops.plist",
  ]
end
