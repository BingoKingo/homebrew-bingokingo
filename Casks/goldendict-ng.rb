# [F] Forked application, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/g/goldendict.rb
cask "goldendict-ng" do
  version "24.01.22"

  qt_version="6.6.1"
  version_name="LoongYear"
  commit="3dddb3be"
  date="240122"

  on_arm do
    sha256 "e47f896a07f7a1fc1060fe2e31dd0c0b342e138862ab461e30cb40c5578e7718"

    url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version}-#{version_name}.#{commit}/#{qt_version}-GoldenDict_flyci-macos-large-latest-m2_homebrew_20#{date}.dmg",
        verified: "github.com/xiaoyifang/goldendict-ng/"
  end
  on_intel do
    on_ventura :or_newer do
      sha256 "1f32ce089b12d033097de3f36c33a2dd2b9c56a46afb68cac6cffec08e21c7eb"
      url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version}-#{version_name}.#{commit}/#{qt_version}-GoldenDict_macos-13_homebrew_20#{date}.dmg",
          verified: "github.com/xiaoyifang/goldendict-ng/"
    end
    on_monterery :or_older do
      url "https://github.com/xiaoyifang/goldendict-ng/releases/download/v#{version}-#{version_name}.#{commit}/#{qt_version}-GoldenDict_macos-12_homebrew_20#{date}.dmg",
          verified: "github.com/xiaoyifang/goldendict-ng/"
      sha256 "591dd1505b4908cd5422d104793400ba615b40dcfdcb8ce630b0d3ab7b803f5f"
    end
  end

  name "GoldenDict-ng"
  desc "Next Generation GoldenDict"
  homepage "https://xiaoyifang.github.io/goldendict-ng/"

  auto_updates true
  conflicts_with cask: "goldendict"
  depends_on macos: ">= :big_sur"

  app "GoldenDict.app"
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
