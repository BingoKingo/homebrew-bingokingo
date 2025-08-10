cask "font-misans-khmer" do
  version "1.200"
  sha256 :no_check

  url "https://hyperos.mi.com/font-download/MiSans_Khmer.zip"
  name "MiSans Khmer VF"
  homepage "https://hyperos.mi.com/font/en/details/khmer/"

  # if sha256 == "ebd601b77f64f054ee1107f9fa0022f57284ae6e2c3342c924893b324cf96c60"
  #   font "MiSans Khmer/可变字体/MiSansKhmerVF.ttf"
  # elsif sha256 == "5369e44d4ea4696a8245504cda592320486eec276403857fff63985239420306"
  #   font "MiSans Khmer/MiSansKhmerVF.ttf"
  # end

  font "MiSans Khmer/MiSansKhmerVF.ttf", target: "MiSansKhmer.ttf"

  preflight do
    if Dir.exist?("#{staged_path}/MiSans Khmer/可变字体")
      FileUtils.mv("#{staged_path}/MiSans Khmer/可变字体/MiSansKhmerVF.ttf",
                   "#{staged_path}/MiSans Khmer/MiSansKhmerVF.ttf")
    end
  end
end
