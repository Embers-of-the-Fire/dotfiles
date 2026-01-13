{ pkgs, ... }:

let
  includeFiles = [
    "alttab"
    "binds"
    "colors"
    "layout"
    "outputs"
    "wpblur"
    "cursor"
  ];
in
{
  programs.niri.package = pkgs.niri-unstable;

  xdg.configFile = builtins.listToAttrs (
    map (name: {
      name = "niri/dms/${name}.kdl";
      value = {
        text = "";
      };
    }) includeFiles
  );

  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableSpawn = true;
      includes = {
        enable = true;
        override = true;
        originalFileName = "niri-flake";
        filesToInclude = includeFiles;
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
