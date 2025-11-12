{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      antialiasing = true;
      configFile = {
        custom-fonts-conf = {
          enable = true;
          priority = 99;
          source = ./fontconfig/conf.d/fonts.conf;
        };
      };
    };
  };
}

