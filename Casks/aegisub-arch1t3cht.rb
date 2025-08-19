cask "aegisub-arch1t3cht" do
  version "12"
  sha256 "ea29a4fc30902e600e85776ef3baceb681ebf75222d186037888a05c7d30f5fb"

  base_version="3.2.2"
  url "https://github.com/arch1t3cht/Aegisub/releases/download/feature_#{version}/macOS.Release.-.installer.zip"
  name "Aegisub"
  desc "Create and modify subtitles"
  homepage "https://github.com/arch1t3cht/Aegisub/"

  container nested: "Aegisub-#{base_version}.dmg"

  app "Aegisub.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/aegisub.wrapper.sh"
  binary shimscript, target: "aegisub"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/bash
      exec '#{appdir}/Aegisub.app/Contents/MacOS/aegisub' "$@"
    EOS
  end

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Aegisub.app"
                   ]
  end

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]

  caveats do
    <<~EOS
      [F] Forked application, modified from:
      https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/a/aegisub.rb
    EOS
  end
end
