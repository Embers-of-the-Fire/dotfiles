{ pkgs, inputs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        position = "top";
        density = "comfortable";
        backgroundOpacity = 0.2;
        monitors = [ "DP-1" ];
        widgets = {
          left = [
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
              id = "AudioVisualizer";
              hideWhenIdel = false;
              width = 150;
            }
            {
              id = "ActiveWindow";
              hideMode = "visible";
              showIcon = false;
              scrollingMode = "hover";
            }
          ];
          center = [
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
            {
              id = "Spacer";
              width = 10;
            }
            { id = "KeepAwake"; }
            { id = "PowerProfile"; }
            { id = "ControlCenter"; }
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
      wallpaper = {
        enabled = false;
        monitorDirectories = [
          {
            name = "DP-1";
            directory = "/home/admin/Theme/Wallpaper";
            wallpaper = "DP-1.png";
          }
          {
            name = "HDMI-A-3";
            directory = "/home/admin/Theme/Wallpaper";
            wallpaper = "HDMI-A-3.png";
          }
        ];
        setWallpaperOnAllMonitors = false;
      };
      network.wifiEnabled = true;
      notifications = {
        respectExpireTimeout = true;
        monitors = [ "DP-1" ];
      };
      osd = {
        monitors = [ "DP-1" ];
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
