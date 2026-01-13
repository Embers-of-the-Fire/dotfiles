{ pkgs, ... }:

{
  systemd.user.services.niri-flake-polkit.enable = false;

  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableSpawn = true;
      includes = {
        enable = true;
        override = true;
      };
    };

    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableDynamicTheming = true;
    enableSystemMonitoring = true;
    enableVPN = true;

    settings = {
      theme = "dark";
    };
  };
}
