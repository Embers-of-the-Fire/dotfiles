{ pkgs, ... }:

{
  systemd.user.services.niri-flake-polkit.enable = false;

  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };

    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboard = true;
    enableSystemMonitoring = true;
    enableVPN = true;

    default.settings = {
      theme = "dark";
      dynamicThemeing = true;
    };
  };
}
