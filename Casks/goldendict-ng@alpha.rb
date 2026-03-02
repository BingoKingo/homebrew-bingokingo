cask "goldendict-ng@alpha" do
  arch arm: "arm64", intel: "x86_64"

  version "26.2.0,39849146"
  qt_version="6.9.1"

  sha256 arm:   "d3fb8b8f701b3ae5ec47c44971283e96f2dc5f9c2f9421478b0d0f9fc2db157c",
         intel: "ada7b6d64dbb13b5137df1cc5a0fe313e99bf4fc84cca098d2c2a6058081581f"

  url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version.csv.first}-alpha.#{version.csv.second}/GoldenDict-ng-#{version.csv.first}-Qt#{qt_version}-macOS-#{arch}.dmg",
      verified: "github.com/xiaoyifang/goldendict-ng/"
  name "GoldenDict-ng"
  desc "Next Generation GoldenDict"
  homepage "https://xiaoyifang.github.io/goldendict-ng/"

  livecheck do
    url "https://api.github.com/repos/xiaoyifang/goldendict-ng/releases"
    regex(/v?(\d+(?:\.\d+)+)-alpha\.([a-zA-Z0-9]+)/i)
    strategy :json do |json_array|
      result = []
      json_array.each do |json|
        if (tag = json["tag_name"]) && (match = tag.match(/v?(\d+(?:\.\d+)+)-alpha\.([a-zA-Z0-9]+)/i))
          result << "#{match[1]},#{match[2]}"
        end
      end
      result
    end
  end

  conflicts_with cask: "goldendict-ng"
  depends_on macos: ">= :monterey"

  shimscript = "#{staged_path}/goldendict.wrapper.sh"
  app "GoldenDict-ng.app", target: "GoldenDict.app"
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
                     "-dr", "com.apple.quarantine", "#{appdir}/GoldenDict.app"
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
      [F] Forked application, modified from:
      https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/g/goldendict.rb
    EOS
  end
end
