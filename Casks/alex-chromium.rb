cask "alex-chromium" do
  arch arm: "ARM", intel: "X64"

  version "116.0.5845.169"
  sha256 arm:   "3d3e0ff5ee0f32848e327877a86bb1279a2bc28ec4a2ffc690b7b85a9fb73c07",
         intel: "894a49d108fd9a82ddf8d6b52d223784a089279ef5bf7a701334de391e8fddb9"

  url "https://github.com/Alex313031/Thorium-MacOS/releases/download/M#{version}/Thorium_MacOS_#{arch}.dmg",
      verified: "github.com/Alex313031/Thorium-MacOS/"
  name "Thorium"
  desc "Chromium fork named after radioactive element No. 90"
  homepage "https://thorium.rocks/"

  depends_on macos: ">= :high_sierra"

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
