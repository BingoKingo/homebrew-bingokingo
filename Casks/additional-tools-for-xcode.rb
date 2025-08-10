cask "additional-tools-for-xcode" do
  version "26.beta.5"
  sha256 "74d8547c0083e49aeba4a63a79cef4678dd0275e3f488345343c449b5a641b27"

  url "https://download.developer.apple.com/Developer_Tools/Additional_Tools_for_Xcode_#{version.dots_to_underscores}/Additional_Tools_for_Xcode_#{version.dots_to_underscores}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Additional Tools for Xcode"
  homepage "https://developer.apple.com/download/all/"

  app "Audio/AU Lab.app"
  app "Audio/HALLab.app"
  app "Hardware/CarPlay Simulator.app"
  app "Hardware/HomeKit Accessory Simulator.app"
  app "Hardware/Printer Simulator.app"
  app "Hardware/PacketLogger.app"
  app "Hardware/IORegistryExplorer.app"
  app "Graphics/OpenGL Profiler.app"
  app "Graphics/Quartz Debug.app"
  app "Graphics/OpenGL Driver Monitor.app"
  app "Graphics/Pixie.app"
  app "Utilities/Clipboard Viewer.app"
  app "Utilities/CrashReporterPrefs.app"
  binary "Utilities/Dictionary Development Kit/bin/add_body_record", target: "dict_add_body_record"
  binary "Utilities/Dictionary Development Kit/bin/add_key_index_record", target: "dict_add_key_index_record"
  binary "Utilities/Dictionary Development Kit/bin/add_reference_index_record",
         target: "dict_add_reference_index_record"
  binary "Utilities/Dictionary Development Kit/bin/add_supplementary_key", target: "dict_add_supplementary_key"
  binary "Utilities/Dictionary Development Kit/bin/build_dict.sh", target: "dict_build_dict.sh"
  binary "Utilities/Dictionary Development Kit/bin/build_key_index", target: "dict_build_key_index"
  binary "Utilities/Dictionary Development Kit/bin/build_reference_index", target: "dict_build_reference_index"
  binary "Utilities/Dictionary Development Kit/bin/extract_front_matter_id.pl",
         target: "dict_extract_front_matter_id.pl"
  binary "Utilities/Dictionary Development Kit/bin/extract_index.pl", target: "dict_extract_index.pl"
  binary "Utilities/Dictionary Development Kit/bin/extract_property.xsl", target: "dict_extract_property.xsl"
  binary "Utilities/Dictionary Development Kit/bin/extract_referred_id.pl", target: "dict_extract_referred_id.pl"
  binary "Utilities/Dictionary Development Kit/bin/generate_dict_template.sh",
         target: "dict_generate_dict_template.sh"
  binary "Utilities/Dictionary Development Kit/bin/make_body.pl", target: "dict_make_body.pl"
  binary "Utilities/Dictionary Development Kit/bin/make_dict_package", target: "dict_make_dict_package"
  binary "Utilities/Dictionary Development Kit/bin/make_line.pl", target: "dict_make_line.pl"
  binary "Utilities/Dictionary Development Kit/bin/make_readonly.pl", target: "dict_make_readonly.pl"
  binary "Utilities/Dictionary Development Kit/bin/normalize_key_text", target: "dict_normalize_key_text"
  binary "Utilities/Dictionary Development Kit/bin/normalize_key_text.pl", target: "dict_normalize_key_text.pl"
  binary "Utilities/Dictionary Development Kit/bin/pick_referred_entry_id.pl",
         target: "dict_pick_referred_entry_id.pl"
  binary "Utilities/Dictionary Development Kit/bin/remove_duplicate_key.pl", target: "dict_remove_duplicate_key.pl"
  binary "Utilities/Dictionary Development Kit/bin/replace_entryid_bodyid.pl",
         target: "dict_replace_entryid_bodyid.pl"
  binary "Graphics/OpenGL Driver Monitor.app/Contents/MacOS/gldrvmond"
  binary "Graphics/OpenGL Driver Monitor.app/Contents/MacOS/gmdlauncher"
  binary "Graphics/OpenGL Profiler.app/Contents/MacOS/ardbgd"
  binary "Graphics/Quartz Debug.app/Contents/MacOS/Server", target: "QuartzDebugServer"
  binary "Hardware/Printer Simulator.app/Contents/MacOS/PrinterSimulatorServer"
  prefpane "Hardware/Network Link Conditioner.prefPane"

  caveats do
    <<~EOS
           [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
