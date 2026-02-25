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
  services.udev.customRules = [
    {
      name = "99-realsense-libusb";
      rules = lib.readFile ./udev/99-realsense-libusb.rules;
    }
    {
      name = "99-cuav";
      rules = lib.readFile ./udev/99-cuav.rules;
    }
  ];
}
