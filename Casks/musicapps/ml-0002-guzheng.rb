cask "ml-0002-guzheng" do
  version "72b56feb4611aa6faa6830526e525ce0-20"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0002_guzheng/ml_0002_guzheng.aar"
  name "ChineseTraditional"
  desc "InstrumentPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0002_guzheng/ml_0002_guzheng.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0002_guzheng.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Apple Loops/z_Legacy/12 Chinese Traditional",
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0002_guzheng.plist",
    "~/Music/Logic Pro Library.bundle/Impulse Responses/01 Large Spaces/02 Halls/03.9s Prince Hall One-OST.SDIR",
    "~/Music/Logic Pro Library.bundle/Impulse Responses/08 Instrument Profiles/8.0s_Guzheng Body.wav",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Chinese Kit.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Chinese Kit.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Chinese Kit.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Drums & Percussion/Percussion/Chinese Kit.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Erhu.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Erhu.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Erhu.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Erhu.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Guzheng.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Guzheng.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Guzheng.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Guzheng.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Pipa.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Pipa.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Pipa.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/z_Legacy/World/Stringed/Pipa.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/Drums & Percussion/Percussion/Chinese Kit.exs",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/Other Strings/Erhu.exs",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/Other Strings/Guzheng.exs",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/Other Strings/Pipa.exs",
    "~/Music/Logic Pro Library.bundle/Samples/Drums & Percussion/Percussion/Chinese Kit_consolidated.caf",
    "~/Music/Logic Pro Library.bundle/Samples/Other Strings/Erhu_consolidated.caf",
    "~/Music/Logic Pro Library.bundle/Samples/Other Strings/Guzheng_consolidated.caf",
    "~/Music/Logic Pro Library.bundle/Samples/Other Strings/Pipa Main_consolidated.caf",
    "~/Music/Logic Pro Library.bundle/Samples/Other Strings/Pipa Resonance_consolidated.caf",
  ]
end
