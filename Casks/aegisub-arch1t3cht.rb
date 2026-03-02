cask "aegisub-arch1t3cht" do
  arch arm: "arm64", intel: "x86_64"

  version "3.4.1,migration02-01"
  sha256 arm:   "2487566e3b1aec275c87bc549063406f1adfaab3cd069eb3a6fcaa76916f6348",
         intel: "9aed3f4181c0f82a366bb224ab94bf074ea73cab863f85b51cf3ca59c088bc91"

  url "https://github.com/arch1t3cht/Aegisub/releases/download/#{version.csv.second}/macOS.#{arch}.Release.-.installer.zip"
  name "Aegisub"
  desc "Create and modify subtitles"
  homepage "https://github.com/arch1t3cht/Aegisub/"

  livecheck do
    url "https://github.com/arch1t3cht/Aegisub/releases.atom"
    strategy :page_match do |page|
      body_version = page.scan(/(\d+\.\d+\.\d+)/).flatten.first
      tag_name = page.scan(%r{/releases/tag/(\w+(?:-\d+)+)}).flatten.first
      "#{body_version},#{tag_name}" if body_version && tag_name
    end
  end

  container nested: "Aegisub-#{version.csv.first}.dmg"

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
                     "-dr", "com.apple.quarantine", "#{appdir}/Aegisub.app"
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
