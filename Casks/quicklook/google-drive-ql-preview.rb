cask "google-drive-ql-preview" do
  version "1.0"
  sha256 "4bd75be897b5f6281e53a3404f3e311f30feae41d0a6efea5315ecc8ca343523"

  url "https://github.com/lukeredmore/google-drive-ql-preview/releases/download/v#{version}/google-drive-ql-preview.app.zip"
  name "google-drive-ql-preview"
  desc "QuickLook Preview support for Google Docs files"
  homepage "https://github.com/lukeredmore/google-drive-ql-preview/"

  app "google-drive-ql-preview.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/google-drive-ql-preview.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Scripts/lukeredmore.google-drive-ql-preview",
    "~/Library/Application Scripts/lukeredmore.google-drive-ql-preview.ql",
    "~/Library/Containers/lukeredmore.google-drive-ql-preview",
    "~/Library/Containers/lukeredmore.google-drive-ql-preview.ql",
  ]
end
