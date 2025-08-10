cask "font-misans-sc" do
  version "4.009"
  sha256 :no_check

  url "https://hyperos.mi.com/font-download/MiSans.zip"
  name "MiSans SC VF"
  homepage "https://hyperos.mi.com/font/en/details/sc/"

  # if sha256 == "8fb800d83691e152e48ed0eb255c91e15ebbdb93104bbff02a75cad26fbce9cb"
  #   font "MiSans/MiSans VF.ttf"
  # elsif sha256 == "b6aa1fc827035922612df8edf36e5609bca1c5441e25cd57572204569b7b81d9"
  #   font "MiSans/可变字体/MiSansVF.ttf"
  # end

  font "MiSans/MiSans VF.ttf", target: "MiSans.ttf"

  preflight do
    if Dir.exist?("#{staged_path}/MiSans/可变字体")
      FileUtils.mv("#{staged_path}/MiSans/可变字体/MiSansVF.ttf",
                   "#{staged_path}/MiSans/MiSans VF.ttf")
    end
  end
end
