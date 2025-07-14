cask "jetifier" do
  version "1.0.0-beta10"
  sha256 "38186db9c9d1b745890b3d35c0667da1cac146ceb3c26aae5bf0802119472c1b"

  url "https://dl.google.com/dl/android/studio/jetifier-zips/#{version}/jetifier-standalone.zip"
  name "Jetifier"
  desc "Migrate support-library-dependent libraries to instead rely on AndroidX packages"
  homepage "https://developer.android.com/studio/command-line/jetifier/"

  livecheck do
    skip
  end

  binary "jetifier-standalone/bin/jetifier-standalone"
  binary "jetifier-standalone/bin/jetifier-standalone", target: "jetifier"
end
