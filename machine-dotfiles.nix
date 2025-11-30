{ environment, lib, ... }:

{
  environment = {
    etc = {
      "systemd/journald.conf".source = lib.mkForce ./systemd/journald.conf;
      "greetd/config-startup.kdl".source = ./greetd/config-startup.kdl;
      "greetd/start-greet.sh"= {
        source = ./greetd/start-greet.sh;
        mode = "0755";
      };
    };
  };
  services.udev.customRules = [
    { name = "99-realsense-libusb";
      rules = lib.readFile ./udev/99-realsense-libusb.rules;
    }
    { name = "99-cuav";
      rules = lib.readFile ./udev/99-cuav.rules;
    }
    { name = "61-msi-mystic-light";
      rules = lib.readFile ./udev/61-msi-mystic-light.rules;
    }
    { name = "61-openrgb-patch";
      rules = lib.readFile ./udev/61-openrgb-patch.rules;
    }
  ];
}

