cask "ml-0038-vintagebreaks" do
  version "3cfca25860bfb02037508f16a31f3f1f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0038_vintagebreaks/ml_0038_vintagebreaks.aar"
  name "VintageBreaks"
  desc "BreakbeatPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0038_vintagebreaks/ml_0038_vintagebreaks.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0038_vintagebreaks.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Basic Vintage Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Big Cow Bell Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Big Room Snare Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Big Tom Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Bongo Classic Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Boomy Tom Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Bouncy Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Bristol Deep Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Busy Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Clave Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Conga Bells Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Conga Madness Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Cowbell Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Crispy Vintage Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Crowded Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Dark Hall Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Deep Rolling Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Deep Snare Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Dirty Conga Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Disco Classic Break 01.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Disco Classic Break 02.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Distant Voices Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/DnB Classic Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Double Dutch Disco 01.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Double Dutch Disco 02.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Double Kick Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Driving Kick Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Driving Ride Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Drum Box Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Dry Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Filthy Vintage Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Freestyle Conga Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Freestyle Conga Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Funky Bell Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Funky Classic Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Funky Echo Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Galloping Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Get Funky Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Grimy Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Guiro Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Hard Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Heavy Toms Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Little Conga Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Massive Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Massive Room Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Midnight Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Noisy Bongo Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rattle Disco Break 01.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rattle Disco Break 02.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rattle Snare Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Riding High Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rimshot Dub Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rimshot Room Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rolling Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rolling Thunder Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Roomy Snare Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Rusty Beater Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Shakers Delight Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Simple Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Simple Snap Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Simple Steady Beat.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Simple Vintage Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Slippery Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Drum Fill 01.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Drum Fill 02.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Drum Fill 03.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Drum Fill 04.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Drum Fill 05.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Drum Fill 06.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Hall Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Improv Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Snare Space Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Soundtrack Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Squeaky Dub Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Squeaky Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Steady Beat Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Steady Rocking Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Sticky Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Sticky High Hat Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Straight Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Summer Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Sweeping Flange Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Tamborine Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Tamborine Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Tempo Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Tense Snare Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Thick Conga Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Thick Hats Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Thin Conga Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Tight Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Trashy Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Tricky Snare Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Ultimate Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Upbeat Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Vintage Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Vintage Sidestick Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Vinyl Funk Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Wah Wah Conga Topper.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Wah Wah Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks/Wet Disco Break.caf",
    "～/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0038_vintagebreaks.plist",
  ]
end
