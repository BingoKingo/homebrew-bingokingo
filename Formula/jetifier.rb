class Jetifier < Formula
  desc "Migrate support-library-dependent libraries to instead rely on AndroidX packages"
  homepage "https://developer.android.com/studio/command-line/jetifier/"
  version "1.0.0-beta10"
  url "https://dl.google.com/dl/android/studio/jetifier-zips/#{version}/jetifier-standalone.zip"

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
