# [F] Forked application, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/g/goldendict.rb
cask "goldendict-ng" do
  version "24.11.0"

  qt_version="6.7.3"
  version_name="alpha"
  commit="c0c164c4"

  on_arm do
    sha256 "b3dc35e6f5862571f7e6eed0444bba319da8645595aad70bcd313e0331192009"

    url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version}-#{version_name}.#{commit}/GoldenDict-ng-#{version}-Qt#{qt_version}-macOS-arm64.dmg",
        verified: "github.com/xiaoyifang/goldendict-ng/"
  end
  on_intel do
    sha256 "17ddc50ee720a0d58dde46cbabba3a1ad9af268d73b77c7795aed18089b59af8"

    url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version}-#{version_name}.#{commit}/GoldenDict-ng-#{version}-Qt#{qt_version}-macOS-arm64.dmg",
        verified: "github.com/xiaoyifang/goldendict-ng/"
  end

  name "GoldenDict-ng"
  desc "Next Generation GoldenDict"
  homepage "https://xiaoyifang.github.io/goldendict-ng/"

  auto_updates true
  conflicts_with cask: "goldendict"
  depends_on macos: ">= :monterey"

  app "GoldenDict-ng.app", target: "GoldenDict.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/goldendict.wrapper.sh"
  binary shimscript, target: "goldendict"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/GoldenDict.app/Contents/MacOS/goldendict' "$@"
    EOS
  end

  zap trash: [
    "~/.goldendict",
    "~/Library/Caches/GoldenDict-ng",
    "~/Library/Preferences/org.xiaoyifang.plist",
    "~/Library/Saved Application State/org.xiaoyifang.savedState",
  ]
end
