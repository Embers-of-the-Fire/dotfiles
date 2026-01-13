{ pkgs, ... }:

{
  programs.niri.package = pkgs.niri-unstable;

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

    managePluginSettings = true;

    plugins = {
      commandRunner.enable = true;
      dankLauncherKeys.enable = true;
      powerUsagePlugin.enable = true;
      nixMonitor.enable = true;
      appShortcut.enable = true;
      dockerManager.enable = true;
      niriWindows.enable = true;
    };
  };
}
