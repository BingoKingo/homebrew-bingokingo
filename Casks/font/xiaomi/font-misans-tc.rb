cask "font-misans-tc" do
  version "4.009"
  sha256 :no_check

  url "https://hyperos.mi.com/font-download/MiSans_TC.zip"
  name "MiSans TC VF"
  homepage "https://hyperos.mi.com/font/en/details/tc/"

  # if sha256 == "e4d17f5af09e3f5194c816ba592d0990d8b377248a896f04657c967d9f4d53f3"
  #   font "MiSans TC/Misans TC VF.ttf"
  # elsif sha256 == "417831f033601f1738fefb2ce9158586d0143385a9dd0c4cfa985bcc16c7443b"
  #   font "MiSans TC/可变字体/MisansTC VF.ttf"
  # end

  font "MiSans TC/Misans TC VF.ttf", target: "MiSansTC.ttf"

  preflight do
    if Dir.exist?("#{staged_path}/MiSans TC/可变字体")
      FileUtils.mv("#{staged_path}/MiSans TC/可变字体/MisansTC VF.ttf",
                   "#{staged_path}/MiSans TC/Misans TC VF.ttf")
    end
  end
end
