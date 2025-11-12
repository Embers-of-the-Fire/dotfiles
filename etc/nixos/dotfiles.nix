{ config, pkgs, lib, ... }:

{
  xdg.configFile = {
    "niri/config.kdl".source = ./niri/config.kdl;
    "niri/config.kdl".force = true;
    "niri/wallpaper.zsh" = {
      source = ./niri/wallpaper.zsh;
      executable = true;
    };
    "starship.toml".source = ./starship.toml;
    "waybar" = { source = ./waybar; recursive = true; };
  };
}

