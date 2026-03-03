{ environment, lib, ... }:

let
  proxy = "http://127.0.0.1:7897";
in
{
  environment = {
    etc = {
      "systemd/journald.conf".source = lib.mkForce ./systemd/journald.conf;
    };
  };
  services.udev.extraRules = lib.concatStringsSep "\n" [
    (lib.readFile ./udev/61-msi-mystic-light.rules)
    (lib.readFile ./udev/61-openrgb-patch.rules)
    (lib.readFile ./udev/92-vial.rules)
    (lib.readFile ./udev/99-cuav.rules)
    (lib.readFile ./udev/99-odin-usb.rules)
    (lib.readFile ./udev/99-realsense-libusb.rules)
    (lib.readFile ./udev/99-vial.rules)
  ];
}
