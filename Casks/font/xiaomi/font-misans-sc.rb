cask "font-misans-sc" do
  version "4.009"

  url "https://hyperos.mi.com/font-download/MiSans.zip"
  name "MiSans SC VF"
  homepage "https://hyperos.mi.com/font/en/details/sc/"
  if sha256 == "8fb800d83691e152e48ed0eb255c91e15ebbdb93104bbff02a75cad26fbce9cb"
    font "MiSans/MiSans VF.ttf"
  elsif sha256 == "b6aa1fc827035922612df8edf36e5609bca1c5441e25cd57572204569b7b81d9"
    font "MiSans/可变字体/MiSansVF.ttf"
  end

  # No zap stanza required
end
