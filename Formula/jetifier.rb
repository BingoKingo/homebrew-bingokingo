class Jetifier < Formula
  desc "Migrate support-library-dependent libraries to instead rely on AndroidX packages"
  homepage "https://developer.android.com/studio/command-line/jetifier/"
  version "1.0.0-beta10"
  url "https://dl.google.com/dl/android/studio/jetifier-zips/#{version}/jetifier-standalone.zip"
  sha256 "38186db9c9d1b745890b3d35c0667da1cac146ceb3c26aae5bf0802119472c1b"
  livecheck do
    skip
  end

  def install
    prefix.install Dir["*"]
    bin.install_symlink bin/"jetifier-standalone" => "jetifier"
    rm Dir[bin/"*.{bat,dll,exe,cmd}"]
    # libexec.install Dir[lib/"*"]
  end

  test do
    system bin/"jetifier-standalone"
  end
end
