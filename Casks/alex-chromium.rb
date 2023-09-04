cask "alex-chromium" do
  arch arm: "ARM", intel: "X64"

  version "115.0.5790.172"
  sha256 arm:   "052a4d9ee2cbfab78671aae2ca9972b3b481fd0d47641d7668c519aa26b8f800",
         intel: "9ed769e69efe14decd37aa192f97a7b5a20fd038074cb217be2bc0d1b949fd4a"

  url "https://github.com/Alex313031/Thorium-MacOS/releases/download/M#{version}/Thorium_MacOS_#{arch}.dmg",
      verified: "github.com/Alex313031/Thorium-MacOS/"
  name "Thorium"
  desc "Chromium fork named after radioactive element No. 90"
  homepage "https://thorium.rocks/"

  app "Thorium.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/thorium.wrapper.sh"
  binary shimscript, target: "thorium"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/bash
      exec '#{appdir}/Thorium.app/Contents/MacOS/Thorium' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/Thorium",
    "~/Library/Caches/Thorium",
    "~/Library/Preferences/org.chromium.Thorium.plist",
    "~/Library/Saved Application State/org.chromium.Thorium.savedState",
  ]
end
