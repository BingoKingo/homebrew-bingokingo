cask "ml-arx0010-manzanamac" do
  version "6ec9d9ef4a744b2eca07596b5a29c31e-26"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_arx0010_manzanamac/ml_arx0010_manzanamac.aar"
  name "TakeADaytrip"
  desc "Manzana"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_arx0010_manzanamac/ml_arx0010_manzanamac.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_arx0010_manzanamac.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_arx0010_manzanamac.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Alternatives/003/DisplayState.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Alternatives/003/DisplayStateArchive",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Alternatives/003/DisplayStateMobile.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Alternatives/003/MetaData.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Alternatives/003/ProjectData",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Contents/Resources/en.lproj/InfoPlist.strings",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Contents/Resources/template.png",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Alchemy Samples/0.7s_Realistic Room.SDIR",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Alchemy Samples/Anastacia Improv Phrases 1 0001-ASF.aaz",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Alchemy Samples/Anastacia Improv Phrases 1 0001.wav",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Alchemy Samples/Canyon Dr.m4a",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Alchemy Samples/Manzana Bell.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Building Reverb Arp.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Chill Vocal Sequences Loop.wav",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Crushed Electric Bass.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Cut Up Synth Bells.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Fire Synth Stutter.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Flanged Electric Bass.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Hybrid Electric Piano.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Low Key Sweep Pad.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Mallet Vibes.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Manzana FX.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Mellotron Vibraphone Octave.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Mellotron Vibraphone.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/On and On Topper Chop.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/On and On Topper.caf",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Pulsating Synth Center.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Pulsating Synth Left 2.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Pulsating Synth Left.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Pulsating Synth Right.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Rough Synth Bass.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Shadow Pulse.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Square Blip Lead.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Super Synth Chords.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Super Synth Lead.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Synth Pluck Chords.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Wavetable Melody.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Audio Files/Wavetable Mid Bells.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Impulse Responses/1.8s_Large & Brite.SDIR",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Clap 1 - Burlington/Clap 1 - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Clap 1 - Doing Science/Clap 1 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Clap 2 - Burlington/Clap 2 - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Clap 2 - Doing Science/Clap 2 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Crash Cymbal - Burlington/Crash Cymbal - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Cymbal 1 - Doing Science/Cymbal 1 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Cymbal 2 - Doing Science/Cymbal 2 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Hi-Hat 1 - Doing Science/Hi-Hat 1 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Hi-Hat 2 - Burlington/Hi-Hat 2 - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Hi-Hat 2 - Doing Science/Hi-Hat 2 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Hi-Hat 2 - Roland TR-808/Hi-Hat - TR-808 Unprocessed.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Hi-Hat Open - Abstract Thought/Hi-Hat Open - Abstract Thought.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Hi-Hat Open - Doing Science/Hi-Hat Open - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Inst 20/Kick 1 - Dark Arts.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Kick 1 - Doing Science/Kick 1 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Kick 2 - Burlington/Kick 2 - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Kick 2 - Doing Science/Kick 2 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Kick 2 Sub - Abstract Thought/Kick 2 Sub - Abstract Thought.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Kick 3 Sub - Burlington/Kick 3 Sub - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Kick Sub - Doing Science/Kick 3 Sub - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Perc FX - Doing Science/PercFX - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Ride Cymbal - Burlington/Ride Cymbal - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Rim - Burlington/Rim - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Rim 1 - Doing Science/Rim 1 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Rim 2 - Doing Science/Rim 2 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Shaker 1 - Modern TR-727/Cabasa - TR-727 Processed.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Snare 1 - Burlington/Snare 1 - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Snare 1 - Doing Science/Snare 1 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Snare 2 - Burlington/Snare 2 - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Snare 2 - Doing Science/Snare 2 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Snare 3 - Doing Science/Snare 3 - Doing Science.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Steinway Piano 2/Steinway Piano 2_consolidated.caf",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Tom High - Burlington/Tom High - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Tom Mid - Burlington/Tom Mid - Burlington.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Media/Samples/Zap - Pile Driver/Zap_PileDriver.aif",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Resources/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Projects/Demo Songs/Manzana - Spatial Audio.logicx/Resources/ProjectInformation.plist",
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
