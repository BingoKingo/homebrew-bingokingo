cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0"
  sha256 arm:   "bae6befc2c3119de3d751c1200aab30af3efa5496e91d5ca1029cc388eea69c5",
         intel: "b60bd78e829b9937c5812e6fc208b72a9235c3a5ba836601d50e1a5be9ac4af2"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow/"

  conflicts_with cask: "deskflow@continuous"
  depends_on macos: ">= :sonoma"

  app "Deskflow.app"
  binary "#{appdir}/Deskflow.app/Contents/MacOS/deskflow-core"
  binary "#{staged_path}/deskflow-client"
  binary "#{staged_path}/deskflow-server"

  preflight do
    File.write "#{staged_path}/deskflow-client", <<~EOS
      #!/bin/bash
      exec '#{appdir}/Deskflow.app/Contents/MacOS/deskflow-core' "client" "$@"
    EOS
    File.write "#{staged_path}/deskflow-server", <<~EOS
      #!/bin/bash
      exec '#{appdir}/Deskflow.app/Contents/MacOS/deskflow-core' "server" "$@"
    EOS
  end

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Support/Deskflow",
    "~/Library/Deskflow",
    "~/Library/Preferences/Deskflow",
    "~/Library/Preferences/org.deskflow.Deskflow.plist",
    "~/Library/Saved Application State/Deskflow.savedState",
  ]
end
