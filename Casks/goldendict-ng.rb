cask "goldendict-ng" do
  arch arm: "arm64", intel: "x86_64"

  version "26.5.1,9973c461"
  qt_version="6.9.1"

  sha256 arm:   "b53ebb8f345f552a947dfb493b1363464cc78398306c2416471a15458957b958",
         intel: "d2700b223ee547e0bd7e8b1fce08486ea278766c3b025824174d03560360aceb"

  url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version.csv.first}-Release.#{version.csv.second}/GoldenDict-ng-#{version.csv.first}-Qt#{qt_version}-macOS-#{arch}.dmg",
      verified: "github.com/xiaoyifang/goldendict-ng/"
  name "GoldenDict-ng"
  desc "Next Generation GoldenDict"
  homepage "https://xiaoyifang.github.io/goldendict-ng/"

  livecheck do
    url "https://api.github.com/repos/xiaoyifang/goldendict-ng/releases"
    regex(/v?(\d+(?:\.\d+)+)-Release\.([a-zA-Z0-9]+)/i)
    strategy :json do |json_array|
      result = []
      json_array.each do |json|
        if (tag = json["tag_name"]) && (match = tag.match(/v?(\d+(?:\.\d+)+)-Release\.([a-zA-Z0-9]+)/i))
          result << "#{match[1]},#{match[2]}"
        end
      end
      result
    end
  end

  conflicts_with cask: "goldendict-ng@alpha"
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
