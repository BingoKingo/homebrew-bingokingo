cask "ml-0045-modularmelodies" do
  version "770ae9cbda220503e5b10e8ad8b1623f-20"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0045_modularmelodies/ml_0045_modularmelodies.aar"
  name "ModularMelodies"
  desc "SynthPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0045_modularmelodies/ml_0045_modularmelodies.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0045_modularmelodies.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "～/Music/Logic Pro Library.bundle/Apple Loops/Modular Melodies",
    "～/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0045_modularmelodies.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Cosmic Dust Arp.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Cosmic Dust Arp.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Cosmic Dust Arp.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Cosmic Dust Arp.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Glass Echoes Arp.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Glass Echoes Arp.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Glass Echoes Arp.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Arpeggiated/Glass Echoes Arp.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Resistance Bass.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Resistance Bass.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Resistance Bass.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Resistance Bass.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Surge Bass.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Surge Bass.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Surge Bass.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Analog Surge Bass.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Deep Circuit Bass.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Deep Circuit Bass.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Deep Circuit Bass.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Deep Circuit Bass.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Stochastic Horizons.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Stochastic Horizons.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Stochastic Horizons.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Stochastic Horizons.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/String Theory Pulse.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/String Theory Pulse.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/String Theory Pulse.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/String Theory Pulse.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Subwave Dragon Bass.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Subwave Dragon Bass.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Subwave Dragon Bass.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Subwave Dragon Bass.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Vox Voltage Bass.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Vox Voltage Bass.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Vox Voltage Bass.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Bass/Vox Voltage Bass.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Analog Lullaby.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Analog Lullaby.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Analog Lullaby.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Analog Lullaby.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Pulse Nexus.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Pulse Nexus.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Pulse Nexus.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Pulse Nexus.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Quantum Grains.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Quantum Grains.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Quantum Grains.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Keyboard/Quantum Grains.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Lead/Effervescent Lead.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Lead/Effervescent Lead.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Lead/Effervescent Lead.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Lead/Effervescent Lead.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Midnight Mallets.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Midnight Mallets.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Midnight Mallets.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Midnight Mallets.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Orbital Chimes.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Orbital Chimes.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Orbital Chimes.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Mallets/Orbital Chimes.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Voltage Waves.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Voltage Waves.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Voltage Waves.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Voltage Waves.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Warm Tides.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Warm Tides.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Warm Tides.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Pad/Warm Tides.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Bent Beyond.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Bent Beyond.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Bent Beyond.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Bent Beyond.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Icicle Plucks.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Icicle Plucks.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Icicle Plucks.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Plucked/Icicle Plucks.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Interrupted Transmission.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Interrupted Transmission.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Interrupted Transmission.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Interrupted Transmission.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Modular Math Beats.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Modular Math Beats.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Modular Math Beats.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Rhythmic/Modular Math Beats.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Sound Effects/Entropy Fields.patch/#Root.cst",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Sound Effects/Entropy Fields.patch/com.apple.musicapps.tags.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Sound Effects/Entropy Fields.patch/data.plist",
    "～/Music/Logic Pro Library.bundle/Patches/Instrument/Synthesizer/Sound Effects/Entropy Fields.patch/prelisten.caf",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Arpeggiated/Cosmic Dust Arp.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Arpeggiated/Glass Echoes Arp.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Bass/Analog Resistance Bass.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Bass/Analog Surge Bass.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Bass/Deep Circuit Bass.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Bass/Stochastic Horizons.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Bass/String Theory Pulse.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Bass/Subwave Dragon Bass.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Bass/Vox Voltage Bass.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Keyboard/Analog Lullaby.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Keyboard/Icicle Plucks.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Keyboard/Pulse Nexus.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Keyboard/Quantum Grains.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Lead/Effervescent Lead.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Mallets/Midnight Mallets.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Mallets/Orbital Chimes.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Pad/Voltage Waves.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Pad/Warm Tides.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Plucked/Bent Beyond.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Rhythmic/Interrupted Transmission.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Rhythmic/Modular Math Beats.acp",
    "～/Music/Logic Pro Library.bundle/Plug-In Settings/Alchemy/Sound Effects/Entropy Fields.acp",
    "～/Music/Logic Pro Library.bundle/Samples/Alchemy Samples/Rhythmic/Custom/Modular Drum loop-001-SF.aaz",
    "～/Music/Logic Pro Library.bundle/Samples/Alchemy Samples/Synth/Custom/Orbital ChimesA0000-A.aaz",
    "～/Music/Logic Pro Library.bundle/Samples/Alchemy Samples/Synth/Custom/Orbital ChimesB0000-A.aaz",
    "～/Music/Logic Pro Library.bundle/Samples/Alchemy Samples/Synth/Custom/Pulse NexusA0000-A.aaz",
  ]
end
