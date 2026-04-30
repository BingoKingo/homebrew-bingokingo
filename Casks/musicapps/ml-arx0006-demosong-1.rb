cask "ml-arx0006-demosong-1" do
  version "de7a02d180a4339624cc7a96aeeaebaa"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_arx0006_demosong_1/ml_arx0006_demosong_1.aar"
  name "TakeADaytrip"
  desc "Manzana"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_arx0006_demosong_1/ml_arx0006_demosong_1.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_arx0006_demosong_1.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_arx0006_demosong_1.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Alternatives/003/DisplayState.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Alternatives/003/DisplayStateArchive",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Alternatives/003/DisplayStateMobile.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Alternatives/003/MetaData.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Alternatives/003/ProjectData",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Alternatives/003/WindowImage.jpg",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Contents/Resources/en.lproj/InfoPlist.strings",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Contents/Resources/template.png",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Alchemy Samples/Canyon Dr.m4a",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Alchemy Samples/Manzana Bell.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Building Reverb Arp.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Chill Vocal Sequences Loop.wav",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Crushed Electric Bass.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Cut Up Synth Bells.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Fire Synth Stutter.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Flanged Electric Bass.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Hybrid Electric Piano.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Low Key Sweep Pad.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Mallet Vibes.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Manzana FX.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Mellotron Vibraphone Octave.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Mellotron Vibraphone.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/On and On Topper Chop.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/On and On Topper.caf",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Pulsating Synth Center.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Pulsating Synth Left 2.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Pulsating Synth Left.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Pulsating Synth Right.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Rough Synth Bass.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Shadow Pulse.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Square Blip Lead.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Super Synth Chords.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Super Synth Lead.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Synth Pluck Chords.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Wavetable Melody.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Media/Audio Files/Wavetable Mid Bells.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Resources/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana.logicx/Resources/ProjectInformation.plist",
  ]
end
