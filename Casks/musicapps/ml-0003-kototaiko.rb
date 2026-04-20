cask "ml-0003-kototaiko" do
  version "6a4cba8925951fa188891d366ba3345c-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0003_kototaiko/ml_0003_kototaiko.aar"
  name "JapaneseTraditional"
  desc "InstrumentPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0003_kototaiko/ml_0003_kototaiko.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0003_kototaiko.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0003_kototaiko.plist",
    "~/Music/Logic Pro Library.bundle/Impulse Responses/01 Large Spaces/01 Rooms/2.1s_Big Drums.SDIR",
    "~/Music/Logic Pro Library.bundle/Impulse Responses/08 Instrument Profiles/8.0s_Koto Body.wav",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Taiko Drums.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Taiko Drums.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Taiko Drums.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Taiko Drums.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Koto.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Koto.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Koto.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Koto.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/Drums & Percussion/Percussion/Taiko Drums.exs",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/Other Strings/Koto.exs",
    "~/Music/Logic Pro Library.bundle/Samples/Drums & Percussion/Percussion/Taiko Drums_consolidated.caf",
    "~/Music/Logic Pro Library.bundle/Samples/Other Strings/Koto_consolidated.caf",
  ]
end
