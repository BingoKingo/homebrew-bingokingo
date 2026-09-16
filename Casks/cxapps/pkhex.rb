cask "pkhex" do
  version "26.7.8+38,9696"
  sha256 "7c38bd8751eae7163d75374ef1522ed679fd552ab1e032059e028241787ab58e"

  url "https://dev.azure.com/project-pokemon/643e4def-7815-4ebe-8feb-fede821d6668/_apis/build/builds/#{version.csv.last}/artifacts?artifactName=PKHeX&%24format=zip"
  name "PKHeX"
  desc "Pokémon Save File Editor"
  homepage "https://projectpokemon.org/pkhex/"

  livecheck do
    url "https://dev.azure.com/project-pokemon/643e4def-7815-4ebe-8feb-fede821d6668/_apis/build/builds?$top=1&artifactName=PKHeX"
    strategy :json do |json|
      build = json["value"]&.first
      next if build.blank?

      "#{build["buildNumber"]},#{build["id"]}"
    end
  end

  preflight do
    require "fileutils"
    target_dir = File.expand_path("~/Library/Application Support/CrossOver/Bottles/Games/drive_c/Program Files/PKHeX")
    FileUtils.mkdir_p(target_dir)
    source_dir = File.join(staged_path, "PKHeX/net10.0-windows/win-x64")
    FileUtils.cp_r(Dir.glob(File.join(source_dir, "**/*")), target_dir)
  end

  zap trash: "~/Library/Application Support/CrossOver/Bottles/Games/drive_c/Program Files/PKHeX"
end
