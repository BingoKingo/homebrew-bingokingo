cask "nhse" do
  version "20260523.1,9520"
  sha256 "57f49cdb370f180909c3054b3eb7e3f02f665c118bd79fcc0939b460a50ddd19"

  url "https://dev.azure.com/project-pokemon/b1a724de-3609-454c-ae59-ab567024e1ac/_apis/build/builds/#{version.csv.last}/artifacts?artifactName=NHSE&%24format=zip"
  name "NHSE"
  desc "Animal Crossing: New Horizons save editor"
  homepage "https://berichan.github.io/GetNHSE/"

  livecheck do
    url "https://dev.azure.com/project-pokemon/b1a724de-3609-454c-ae59-ab567024e1ac/_apis/build/builds?$top=1&artifactName=NHSE"
    strategy :json do |json|
      build = json["value"]&.first
      next if build.blank?

      "#{build["buildNumber"]},#{build["id"]}"
    end
  end

  preflight do
    require "fileutils"
    target_dir = File.expand_path("~/Library/Application Support/CrossOver/Bottles/Games/drive_c/Program Files/NHSE")
    FileUtils.mkdir_p(target_dir)
    source_dir = File.join(staged_path, "NHSE")
    FileUtils.cp_r(Dir.glob(File.join(source_dir, "**/*")), target_dir)
  end

  zap trash: "~/Library/Application Support/CrossOver/Bottles/Games/drive_c/Program Files/NHSE"
end
