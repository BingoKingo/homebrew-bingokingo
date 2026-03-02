cask "quicklookprotein" do
  version "1.5"
  sha256 "2c0d4a8d0477cf6a8415ab7c8ec0f944aaeb172b39fe6a68a3213bbfb1ebbb3c"

  url "https://github.com/JethroHemmann/QuickLookProtein/releases/download/v#{version}/QuickLookProtein.#{version}.zip"
  name "QuickLookProtein"
  desc "Quick Look extension to preview protein/3D structure files (PDB, SDF, CIF)"
  homepage "https://github.com/JethroHemmann/QuickLookProtein/"

  depends_on macos: ">=:big_sur"

  app "QuickLookProtein.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/QuickLookProtein.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Scripts/com.jethrohemmann.QuickLookProtein",
    "~/Library/Application Scripts/com.jethrohemmann.QuickLookProtein.QLExtension",
    "~/Library/Application Scripts/W3SKSV7VPT.group.com.jethrohemmann.QuickLookProtein",
    "~/Library/Containers/com.jethrohemmann.QuickLookProtein",
    "~/Library/Containers/com.jethrohemmann.QuickLookProtein.QLExtension",
    "~/Library/Group Containers/W3SKSV7VPT.group.com.jethrohemmann.QuickLookProtein",
  ]
end
