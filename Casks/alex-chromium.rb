cask "alex-chromium" do
  arch arm: "ARM", intel: "X64"

  version "114.0.5735.205-1"
  sha256 arm:   "32d65b970bffb0f0c615cda617268bba0aa925c41dece1f7dd93855573c9c933",
         intel: "ec29c5f723649b8104a21421123b55d904bc17b0d58c05faa4e7d4d834637ddd"

  url "https://github.com/Alex313031/Thorium-Special/releases/download/M#{version}/Thorium_MacOS_#{arch}.dmg",
      verified: "github.com/Alex313031/Thorium-Special/"
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
