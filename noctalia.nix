{ pkgs, inputs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        position = "bottom";
        density = "comfortable";
        backgroundOpacity = 0.2;
        monitors = [ "DP-1" ];
        widgets = {
          left = [
            { id = "ControlCenter"; }
            {
              id = "SystemMonitor";
              usePrimaryColor = false;
              showCpuUsage = true;
              showCpuTemp = true;
              showMemoryUsage = true;
              showNetworkStats = true;
              showDiskUsage = true;
              diskPath = "/";
            }
            {
              id = "ActiveWindow";
              hideMode = "visible";
              showIcon = false;
              scrollingMode = "hover";
            }
          ];
          center = [
            {
              id = "AudioVisualizer";
              hideWhenIdel = false;
              width = 150;
            }
            { id = "Workspace"; }
          ];
          right = [
            {
              id = "Tray";
              drawerEnabled = false;
            }
            { id = "Spacer"; }
            { id = "ScreenRecorder"; }
            { id = "NotificationHistory"; }
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            { id = "Volume"; }
            { id = "Spacer"; width = 10; }
            { id = "KeepAwake"; }
            { id = "PowerProfile"; }
            { id = "Clock"; }
            { id = "SessionMenu"; }
          ];
        };
      };
      general = {
        lockOnSuspend = false;
        showHibernateOnLockScreen = true;
      };
      ui = {
        settingsPanelAttachToBar = true;
      };
      location = {
        name = "Nanjing - China";
        monthBeforeDay = false;
        firstDayOfWeek = 1;
      };
      appLauncher = {
        enableClipboardHistory = true;
        terminalCommand = "alacritty -e";
        viewMode = "grid";
      };
      systemMonnitor = {
        tempWarningThreshold = 75;
        tempCriticalThreshold = 85;
      };
      dock = {
        enabled = true;
      };
      wallpaper.enabled = false;
      network.wifiEnabled = true;
      notifications = {
        respectExpireTimeout = true;
      };
      colorSchemes = {
        useWallpaperColors = true;
        darkMode = true;
        matugenSchemeType = "scheme-content";
      };
      templates = {
        gtk = true;
        qt = true;
        kcolorscheme = true;
        alacritty = true;
        discord = true;
        code = true;
      };
    };
  };
}
