cask "ml-0034-mellotron" do
  version "70547feae66d825057c4f675c1e2b74b-16"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0034_mellotron/ml_0034_mellotron.aar"
  name "VintageMellotron"
  desc "SynthPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0034_mellotron/ml_0034_mellotron.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0034_mellotron.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0034_mellotron.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Airy Choir.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Airy Choir.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Airy Choir.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Airy Choir.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Boys Choir.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Boys Choir.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Boys Choir.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Boys Choir.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass Choir.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass Choir.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass Choir.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass Choir.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brass.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brassy Sequence.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brassy Sequence.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brassy Sequence.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Brassy Sequence.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cello.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cello.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cello.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cello.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir & Flute.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir & Flute.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir & Flute.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir & Flute.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Choir.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cloud Choir.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cloud Choir.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cloud Choir.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Cloud Choir.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flute.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flute.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flute.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flute.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flutes.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flutes.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flutes.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Flutes.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron GC Brass.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron GC Brass.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron GC Brass.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron GC Brass.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lo-Fi Lead.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lo-Fi Lead.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lo-Fi Lead.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lo-Fi Lead.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lush Sci-Fi Pad.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lush Sci-Fi Pad.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lush Sci-Fi Pad.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Lush Sci-Fi Pad.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Orchestra Swirl.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Orchestra Swirl.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Orchestra Swirl.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Orchestra Swirl.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Replicant Pad.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Replicant Pad.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Replicant Pad.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Replicant Pad.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Shimmering Chords.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Shimmering Chords.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Shimmering Chords.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Shimmering Chords.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Skating Pad.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Skating Pad.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Skating Pad.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Skating Pad.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Strings & Flute.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Strings & Flute.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Strings & Flute.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Strings & Flute.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Vintage Pattern.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Vintage Pattern.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Vintage Pattern.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Vintage Pattern.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Violins.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Violins.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Violins.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Keyboard/Mellotron/Mellotron Violins.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/z_Internal/Mellotron/Mellotron.exs",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/3 Violins.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/8 Choir & Flute.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/Boys Choir.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/Brass.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/Cello.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/Flute.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/Flutes.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/GC 3 Brass.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/Mixed Choir.pst",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Vintage Mellotron/Strings & Flute.pst",
    "~/Music/Logic Pro Library.bundle/Samples/Keyboard/Mellotron/Mellotron_consolidated.caf",
  ]
end
