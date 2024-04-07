cask "qlwindowsapps" do
  version "1.3.3"
  sha256 "f65b3af97a05fa3a1bd1d98012c3c34d836325d578177e559b3b722b1ef9ed75"

  url "https://github.com/shysaur/QLWindowsApps/releases/download/release_#{version}/QLWindowsApps-#{version}.pkg"
  name "QLWindowsApps"
  desc "QuickLook & Spotlight plugins for Windows DLLs and EXEs"
  homepage "https://github.com/shysaur/QLWindowsApps/"

  depends_on macos: ">= :high_sierra"

  pkg "QLWindowsApps-#{version}.pkg", allow_untrusted: true

  uninstall pkgutil: [
    "com.danielecattaneo.qlgenerator.qlwindowsapps",
    "com.danielecattaneo.WindowsAppslmporter",
  ]
end
