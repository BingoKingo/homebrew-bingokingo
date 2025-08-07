cask "apkquicklook" do
  version "1.0"
  sha256 "28044c521d8cf6048c363f59664f33c0f8d63c2ccd0f69905c30df8be4c9411e"

  url "https://github.com/grishka/ApkQuickLook/releases/download/#{version}/ApkQuickLook.pkg"
  name "ApkQuickLook"
  desc "QuickLook plugin for Android APK files"
  homepage "https://github.com/grishka/ApkQuickLook/"

  pkg "ApkQuickLook.pkg", allow_untrusted: true

  uninstall pkgutil: "me.grishka.ApkQuickLook"
end
