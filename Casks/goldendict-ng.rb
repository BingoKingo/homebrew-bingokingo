cask "goldendict-ng" do
  version "25.07.0"

  qt_version="6.9.1"
  version_name="alpha"
  commit="ef1eaebe"

  on_arm do
    sha256 "7152256476eb2a0a507544fafdceccea5683d73f5c6612fa76000f871aa12fcd"

    url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version}-#{version_name}.#{commit}/GoldenDict-ng-#{version}-Qt#{qt_version}-macOS-arm64.dmg",
        verified: "github.com/xiaoyifang/goldendict-ng/"
  end
  on_intel do
    sha256 "93f7dcd44180dd205f6cf27ae2602f93ff7299410cca4ec19b891d2225885184"

    url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version}-#{version_name}.#{commit}/GoldenDict-ng-#{version}-Qt#{qt_version}-macOS-x86_64.dmg",
        verified: "github.com/xiaoyifang/goldendict-ng/"
  end

  name "GoldenDict-ng"
  desc "Next Generation GoldenDict"
  homepage "https://xiaoyifang.github.io/goldendict-ng/"

  conflicts_with cask: "goldendict"
  depends_on macos: ">= :monterey"

  app "GoldenDict-ng.app", target: "GoldenDict.app"
  shimscript = "#{staged_path}/goldendict.wrapper.sh"
  binary shimscript, target: "goldendict"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/GoldenDict.app/Contents/MacOS/goldendict' "$@"
    EOS
  end

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/GoldenDict.app"
                   ]
  end

  zap trash: [
    "~/.goldendict",
    "~/Library/Caches/GoldenDict-ng",
    "~/Library/Preferences/org.xiaoyifang.plist",
    "~/Library/Saved Application State/org.xiaoyifang.savedState",
  ]

  caveats do
    <<~EOS
      \033[1m[F]\033[0m Forked application, modified from:
      https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/g/goldendict.rb
    EOS
  end
end
