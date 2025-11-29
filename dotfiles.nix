{ config, pkgs, lib, ... }:

{
  xdg.configFile = {
    "niri/config.kdl" = {
      source = ./niri/config.kdl;
      force = true;
    };
    "niri/wallpaper.fish" = {
      source = ./niri/wallpaper.fish;
      executable = true;
    };
    "niri/clipboard.zsh" = {
      source = ./niri/clipboard.zsh;
      executable = true;
    };
    "starship.toml".source = ./starship.toml;
    "waybar" = { source = ./waybar; recursive = true; };
    "rofi/themes" = {
      source = ./rofi/themes;
      recursive = true;
    };
  };
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
    "application/x-7z-compressed" = "org.kde.ark.desktop";
    "application/pdf" = "org.pwmt.zathura.desktop";
  };
}

