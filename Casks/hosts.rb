cask "hosts" do
  version "1.4.5"
  sha256 "e625edd5bbce4766225a77f61aa6efa82e6fd95ba95a9bd48abe09238b8bea01"

  url "https://www.dirk-froehling.de/resources/Software/Hosts-PrefPane-#{version}.pkg",
      # url "https://www.dirk-froehling.de/resources/Software/Hosts-App-#{version}.zip",
      verified: "dirk-froehling.de/resources/Software/"
  name "Hosts"
  desc "Cocoa GUI Prefpane for Hosts"
  homepage "https://github.com/specialunderwear/Hosts.prefpane/"

  # app "Hosts.app"
  pkg "Hosts-PrefPane-#{version}.pkg", allow_untrusted: true

  uninstall pkgutil: "de.dirk-froehling.hosts"
end
