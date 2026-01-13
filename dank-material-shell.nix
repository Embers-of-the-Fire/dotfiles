{ pkgs, ... }:

{
  programs.niri.package = pkgs.niri-unstable;

  xdg.configFile = {
    "alttab".text = "";
    "binds".text = "";
    "colors".text = "";
    "layout".text = "";
    "outputs".text = "";
    "wpblur".text = "";
  };

  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableSpawn = true;
      includes = {
        enable = true;
        override = true;
        originalFileName = "niri-flake";
        filesToInclude = [
          "alttab"
          "binds"
          "colors"
          "layout"
          "outputs"
          "wpblur"
        ];
      };
    };

    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableDynamicTheming = true;
    enableSystemMonitoring = true;
    enableVPN = true;

    settings = {
      theme = "dark";
      isLightMode = false;
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
