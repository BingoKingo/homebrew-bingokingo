cask "ml-0036-studiostrings" do
  version "3f6fe8ed789b5db63b67de7a26c38405-175"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0036_studiostrings/ml_0036_studiostrings.aar"
  name "StudioStrings"
  desc "InstrumentPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0036_studiostrings/ml_0036_studiostrings.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0036_studiostrings.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Apple Loops/Studio Strings",
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0036_studiostrings.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/AbbeyWood.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/Cellos.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/Violins1.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Abbey Wood.patch/Violins2.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/Bloomsbury.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/Cellos.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/Violas.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/Violins1.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Bloomsbury.patch/Violins2.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Eden Park.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Eden Park.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Eden Park.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Eden Park.patch/EdenPark.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Eden Park.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Eden Park.patch/Violins1.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Eden Park.patch/Violins2.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/Cellos.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/Kensington.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/Violins1.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/Kensington.patch/Violins2.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/Cellos.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/DoubleBasses.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/KingsCross.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/Violas.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/Violins1.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Section Instruments/King's Cross.patch/Violins2.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Cellos.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Cellos.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Cellos.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Cellos.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Double Basses.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Double Basses.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Double Basses.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Double Basses.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violas.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violas.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violas.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violas.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 1.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 1.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 1.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 1.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 2.patch/#Root.cst",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 2.patch/com.apple.musicapps.tags.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 2.patch/data.plist",
    "~/Music/Logic Pro Library.bundle/Patches/Instrument/Strings/Studio Strings/Studio Violins 2.patch/prelisten.caf",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/z_Internal/Studio Strings/Section Instruments",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Sampler/z_Internal/Studio Strings/Single Instruments",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Studio Strings/Experimental",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Studio Strings/Sections",
    "~/Music/Logic Pro Library.bundle/Plug-In Settings/Studio Strings/Single Instruments",
    "~/Music/Logic Pro Library.bundle/Samples/Strings/Studio Strings",
  ]
end
