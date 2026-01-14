{
  currentThemeName = "dynamic";
  currentThemeCategory = "dynamic";
  customThemeFile = "";
  registryThemeVariants = { };
  matugenScheme = "scheme-neutral";
  runUserMatugenTemplates = true;
  matugenTargetMonitor = "";
  popupTransparency = 1;
  dockTransparency = 1;
  widgetBackgroundColor = "sch";
  widgetColorMode = "default";
  cornerRadius = 12;
  niriLayoutGapsOverride = -1;
  niriLayoutRadiusOverride = -1;
  niriLayoutBorderSize = -1;
  hyprlandLayoutGapsOverride = -1;
  hyprlandLayoutRadiusOverride = -1;
  hyprlandLayoutBorderSize = -1;
  mangoLayoutGapsOverride = -1;
  mangoLayoutRadiusOverride = -1;
  mangoLayoutBorderSize = -1;
  use24HourClock = true;
  showSeconds = false;
  useFahrenheit = false;
  nightModeEnabled = true;
  animationSpeed = 1;
  customAnimationDuration = 500;
  wallpaperFillMode = "Fill";
  blurredWallpaperLayer = false;
  blurWallpaperOnOverview = false;
  showLauncherButton = true;
  showWorkspaceSwitcher = true;
  showFocusedWindow = true;
  showWeather = true;
  showMusic = true;
  showClipboard = true;
  showCpuUsage = true;
  showMemUsage = true;
  showCpuTemp = true;
  showGpuTemp = true;
  selectedGpuIndex = 0;
  enabledGpuPciIds = [ ];
  showSystemTray = true;
  showClock = true;
  showNotificationButton = true;
  showBattery = true;
  showControlCenterButton = true;
  showCapsLockIndicator = true;
  controlCenterShowNetworkIcon = true;
  controlCenterShowBluetoothIcon = true;
  controlCenterShowAudioIcon = true;
  controlCenterShowAudioPercent = false;
  controlCenterShowVpnIcon = true;
  controlCenterShowBrightnessIcon = false;
  controlCenterShowBrightnessPercent = false;
  controlCenterShowMicIcon = false;
  controlCenterShowMicPercent = false;
  controlCenterShowBatteryIcon = false;
  controlCenterShowPrinterIcon = false;
  showPrivacyButton = true;
  privacyShowMicIcon = false;
  privacyShowCameraIcon = false;
  privacyShowScreenShareIcon = false;
  controlCenterWidgets = [
    {
      enabled = true;
      id = "volumeSlider";
      width = 50;
    }
    {
      enabled = true;
      id = "brightnessSlider";
      width = 50;
    }
    {
      enabled = true;
      id = "wifi";
      width = 50;
    }
    {
      enabled = true;
      id = "bluetooth";
      width = 50;
    }
    {
      enabled = true;
      id = "audioOutput";
      width = 50;
    }
    {
      enabled = true;
      id = "audioInput";
      width = 50;
    }
    {
      enabled = true;
      id = "nightMode";
      width = 50;
    }
    {
      enabled = true;
      id = "darkMode";
      width = 50;
    }
  ];
  showWorkspaceIndex = false;
  showWorkspaceName = false;
  showWorkspacePadding = true;
  workspaceScrolling = false;
  showWorkspaceApps = false;
  maxWorkspaceIcons = 3;
  groupWorkspaceApps = true;
  workspaceFollowFocus = false;
  showOccupiedWorkspacesOnly = true;
  reverseScrolling = false;
  dwlShowAllTags = false;
  workspaceColorMode = "default";
  workspaceUnfocusedColorMode = "default";
  workspaceUrgentColorMode = "default";
  workspaceFocusedBorderEnabled = false;
  workspaceFocusedBorderColor = "secondary";
  workspaceFocusedBorderThickness = 2;
  workspaceNameIcons = { };
  waveProgressEnabled = true;
  scrollTitleEnabled = true;
  audioVisualizerEnabled = true;
  audioScrollMode = "nothing";
  clockCompactMode = false;
  focusedWindowCompactMode = false;
  runningAppsCompactMode = true;
  keyboardLayoutNameCompactMode = false;
  runningAppsCurrentWorkspace = false;
  runningAppsGroupByApp = false;
  appIdSubstitutions = [
    {
      pattern = "Spotify";
      replacement = "spotify";
      type = "exact";
    }
    {
      pattern = "beepertexts";
      replacement = "beeper";
      type = "exact";
    }
    {
      pattern = "home assistant desktop";
      replacement = "homeassistant-desktop";
      type = "exact";
    }
    {
      pattern = "com.transmissionbt.transmission";
      replacement = "transmission-gtk";
      type = "contains";
    }
    {
      pattern = "^steam_app_(d+)$";
      replacement = "steam_icon_$1";
      type = "regex";
    }
  ];
  centeringMode = "index";
  clockDateFormat = "yyyy-MM-dd dddd";
  lockDateFormat = "";
  mediaSize = 1;
  appLauncherViewMode = "list";
  spotlightModalViewMode = "list";
  sortAppsAlphabetically = false;
  appLauncherGridColumns = 4;
  spotlightCloseNiriOverview = true;
  niriOverviewOverlayEnabled = true;
  useAutoLocation = false;
  weatherEnabled = true;
  networkPreference = "auto";
  vpnLastConnected = "";
  iconTheme = "System Default";
  cursorSettings = {
    dwl = {
      cursorHideTimeout = 0;
    };
    hyprland = {
      hideOnKeyPress = false;
      hideOnTouch = false;
      inactiveTimeout = 0;
    };
    niri = {
      hideAfterInactiveMs = 0;
      hideWhenTyping = false;
    };
    size = 24;
    theme = "System Default";
  };
  launcherLogoMode = "apps";
  launcherLogoCustomPath = "";
  launcherLogoColorOverride = "";
  launcherLogoColorInvertOnMode = false;
  launcherLogoBrightness = 0.5;
  launcherLogoContrast = 1;
  launcherLogoSizeOffset = 0;
  fontFamily = "Inter Variable";
  monoFontFamily = "Maple Mono NF CN Medium";
  fontWeight = 400;
  fontScale = 1;
  notepadUseMonospace = true;
  notepadFontFamily = "";
  notepadFontSize = 14;
  notepadShowLineNumbers = false;
  notepadTransparencyOverride = -1;
  notepadLastCustomTransparency = 0.7;
  soundsEnabled = true;
  useSystemSoundTheme = false;
  soundNewNotification = true;
  soundVolumeChanged = true;
  soundPluggedIn = true;
  acMonitorTimeout = 5400;
  acLockTimeout = 1800;
  acSuspendTimeout = 10800;
  acSuspendBehavior = 0;
  acProfileName = "0";
  batteryMonitorTimeout = 0;
  batteryLockTimeout = 0;
  batterySuspendTimeout = 0;
  batterySuspendBehavior = 0;
  batteryProfileName = "";
  batteryChargeLimit = 100;
  lockBeforeSuspend = true;
  loginctlLockIntegration = true;
  fadeToLockEnabled = true;
  fadeToLockGracePeriod = 5;
  fadeToDpmsEnabled = true;
  fadeToDpmsGracePeriod = 5;
  launchPrefix = "";
  brightnessDevicePins = { };
  wifiNetworkPins = { };
  bluetoothDevicePins = { };
  audioInputDevicePins = { };
  audioOutputDevicePins = { };
  gtkThemingEnabled = false;
  qtThemingEnabled = false;
  syncModeWithPortal = true;
  terminalsAlwaysDark = false;
  runDmsMatugenTemplates = true;
  matugenTemplateGtk = true;
  matugenTemplateNiri = true;
  matugenTemplateHyprland = true;
  matugenTemplateMangowc = true;
  matugenTemplateQt5ct = true;
  matugenTemplateQt6ct = true;
  matugenTemplateFirefox = true;
  matugenTemplatePywalfox = true;
  matugenTemplateZenBrowser = true;
  matugenTemplateVesktop = true;
  matugenTemplateEquibop = true;
  matugenTemplateGhostty = true;
  matugenTemplateKitty = true;
  matugenTemplateFoot = true;
  matugenTemplateAlacritty = true;
  matugenTemplateNeovim = true;
  matugenTemplateWezterm = true;
  matugenTemplateDgop = true;
  matugenTemplateKcolorscheme = true;
  matugenTemplateVscode = true;
  showDock = false;
  dockAutoHide = false;
  dockGroupByApp = false;
  dockOpenOnOverview = false;
  dockPosition = 0;
  dockSpacing = 4;
  dockBottomGap = 0;
  dockMargin = 0;
  dockIconSize = 40;
  dockIndicatorStyle = "circle";
  dockBorderEnabled = false;
  dockBorderColor = "surfaceText";
  dockBorderOpacity = 1;
  dockBorderThickness = 1;
  dockIsolateDisplays = false;
  notificationOverlayEnabled = true;
  modalDarkenBackground = true;
  lockScreenShowPowerActions = true;
  lockScreenShowSystemIcons = true;
  lockScreenShowTime = true;
  lockScreenShowDate = true;
  lockScreenShowProfileImage = true;
  lockScreenShowPasswordField = true;
  enableFprint = false;
  maxFprintTries = 15;
  lockScreenActiveMonitor = "DP-1";
  lockScreenInactiveColor = "#000000";
  lockScreenNotificationMode = 2;
  hideBrightnessSlider = false;
  notificationTimeoutLow = 3000;
  notificationTimeoutNormal = 5000;
  notificationTimeoutCritical = 0;
  notificationCompactMode = false;
  notificationPopupPosition = 0;
  notificationHistoryEnabled = true;
  notificationHistoryMaxCount = 50;
  notificationHistoryMaxAgeDays = 7;
  notificationHistorySaveLow = true;
  notificationHistorySaveNormal = true;
  notificationHistorySaveCritical = true;
  osdAlwaysShowValue = false;
  osdPosition = 5;
  osdVolumeEnabled = true;
  osdMediaVolumeEnabled = true;
  osdBrightnessEnabled = true;
  osdIdleInhibitorEnabled = true;
  osdMicMuteEnabled = true;
  osdCapsLockEnabled = true;
  osdPowerProfileEnabled = true;
  osdAudioOutputEnabled = true;
  powerActionConfirm = true;
  powerActionHoldDuration = 0.5;
  powerMenuActions = [
    "reboot"
    "logout"
    "poweroff"
    "lock"
    "suspend"
    "restart"
  ];
  powerMenuDefaultAction = "logout";
  powerMenuGridLayout = false;
  customPowerActionLock = "";
  customPowerActionLogout = "";
  customPowerActionSuspend = "";
  customPowerActionHibernate = "";
  customPowerActionReboot = "";
  customPowerActionPowerOff = "";
  updaterHideWidget = false;
  updaterUseCustomCommand = false;
  updaterCustomCommand = "";
  updaterTerminalAdditionalParams = "";
  displayNameMode = "system";
  screenPreferences = {
    wallpaper = [ ];
  };
  showOnLastDisplay = { };
  niriOutputSettings = { };
  hyprlandOutputSettings = { };
  barConfigs = [
    {
      autoHide = false;
      autoHideDelay = 250;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 1;
      bottomGap = 0;
      centerWidgets = [
        {
          enabled = true;
          id = "music";
        }
        {
          enabled = true;
          id = "focusedWindow";
        }
        {
          enabled = true;
          id = "privacyIndicator";
        }
      ];
      enabled = true;
      fontScale = 1;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      gothCornersEnabled = false;
      id = "default";
      innerPadding = 4;
      leftWidgets = [
        {
          enabled = true;
          id = "launcherButton";
        }
        {
          enabled = true;
          id = "workspaceSwitcher";
        }
        {
          enabled = true;
          id = "cpuUsage";
        }
        {
          enabled = true;
          id = "cpuTemp";
        }
        {
          enabled = true;
          id = "gpuTemp";
          pciId = "10de:2b8c";
          selectedGpuIndex = 0;
        }
        {
          enabled = true;
          id = "memUsage";
        }
        {
          enabled = true;
          id = "diskUsage";
        }
        {
          enabled = true;
          id = "network_speed_monitor";
        }
      ];
      name = "Main Bar";
      noBackground = false;
      openOnOverview = false;
      popupGapsAuto = true;
      popupGapsManual = 4;
      position = 1;
      rightWidgets = [
        {
          enabled = true;
          id = "dockerManager";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "systemTray";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "clipboard";
        }
        {
          enabled = true;
          id = "notificationButton";
        }
        {
          enabled = true;
          id = "notepadButton";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "clock";
        }
        {
          enabled = true;
          id = "weather";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "battery";
        }
        {
          enabled = true;
          id = "idleInhibitor";
        }
        {
          enabled = true;
          id = "controlCenterButton";
        }
        {
          enabled = true;
          id = "powerMenuButton";
        }
      ];
      screenPreferences = [
        {
          model = "U27E11X";
          name = "DP-1";
        }
        {
          model = "OF27U";
          name = "DP-2";
        }
      ];
      showOnLastDisplay = false;
      spacing = 4;
      squareCorners = false;
      transparency = 1;
      visible = true;
      widgetTransparency = 1;
    }
    {
      autoHide = false;
      autoHideDelay = 250;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 1;
      bottomGap = 0;
      centerWidgets = [
        {
          enabled = true;
          id = "music";
        }
        {
          enabled = true;
          id = "focusedWindow";
        }
        {
          enabled = true;
          id = "privacyIndicator";
        }
      ];
      enabled = true;
      fontScale = 1;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      gothCornersEnabled = false;
      id = "bar1768336133950";
      innerPadding = 4;
      leftWidgets = [
        {
          enabled = true;
          id = "launcherButton";
        }
        {
          enabled = true;
          id = "workspaceSwitcher";
        }
        {
          enabled = true;
          id = "cpuUsage";
        }
        {
          enabled = true;
          id = "cpuTemp";
        }
        {
          enabled = true;
          id = "gpuTemp";
          pciId = "10de:2b8c";
          selectedGpuIndex = 0;
        }
        {
          enabled = true;
          id = "memUsage";
        }
        {
          enabled = true;
          id = "diskUsage";
        }
        {
          enabled = true;
          id = "network_speed_monitor";
        }
      ];
      maximizeDetection = true;
      name = "Bar 2";
      noBackground = false;
      openOnOverview = false;
      popupGapsAuto = true;
      popupGapsManual = 4;
      position = 2;
      rightWidgets = [
        {
          enabled = true;
          id = "dockerManager";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "systemTray";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "clipboard";
        }
        {
          enabled = true;
          id = "notificationButton";
        }
        {
          enabled = true;
          id = "notepadButton";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "clock";
        }
        {
          enabled = true;
          id = "weather";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        {
          enabled = true;
          id = "battery";
        }
        {
          enabled = true;
          id = "idleInhibitor";
        }
        {
          enabled = true;
          id = "controlCenterButton";
        }
        {
          enabled = true;
          id = "powerMenuButton";
        }
      ];
      screenPreferences = [
        {
          model = "HP24QI";
          name = "HDMI-A-2";
        }
      ];
      scrollEnabled = true;
      scrollXBehavior = "column";
      scrollYBehavior = "workspace";
      shadowColorMode = "text";
      shadowCustomColor = "#000000";
      shadowIntensity = 0;
      shadowOpacity = 60;
      showOnLastDisplay = false;
      showOnWindowsOpen = false;
      spacing = 4;
      squareCorners = false;
      transparency = 1;
      visible = true;
      widgetOutlineColor = "primary";
      widgetOutlineEnabled = false;
      widgetOutlineOpacity = 1;
      widgetOutlineThickness = 1;
      widgetTransparency = 1;
    }
  ];
  desktopClockEnabled = false;
  desktopClockStyle = "analog";
  desktopClockTransparency = 0.8;
  desktopClockColorMode = "primary";
  desktopClockCustomColor = {
    r = 1;
    g = 1;
    b = 1;
    a = 1;
    hsvHue = -1;
    hsvSaturation = 0;
    hsvValue = 1;
    hslHue = -1;
    hslSaturation = 0;
    hslLightness = 1;
    valid = true;
  };
  desktopClockShowDate = true;
  desktopClockShowAnalogNumbers = false;
  desktopClockShowAnalogSeconds = true;
  desktopClockX = -1;
  desktopClockY = -1;
  desktopClockWidth = 280;
  desktopClockHeight = 180;
  desktopClockDisplayPreferences = [
    "all"
  ];
  systemMonitorEnabled = false;
  systemMonitorShowHeader = true;
  systemMonitorTransparency = 0.8;
  systemMonitorColorMode = "primary";
  systemMonitorCustomColor = {
    r = 1;
    g = 1;
    b = 1;
    a = 1;
    hsvHue = -1;
    hsvSaturation = 0;
    hsvValue = 1;
    hslHue = -1;
    hslSaturation = 0;
    hslLightness = 1;
    valid = true;
  };
  systemMonitorShowCpu = true;
  systemMonitorShowCpuGraph = true;
  systemMonitorShowCpuTemp = true;
  systemMonitorShowGpuTemp = false;
  systemMonitorGpuPciId = "";
  systemMonitorShowMemory = true;
  systemMonitorShowMemoryGraph = true;
  systemMonitorShowNetwork = true;
  systemMonitorShowNetworkGraph = true;
  systemMonitorShowDisk = true;
  systemMonitorShowTopProcesses = false;
  systemMonitorTopProcessCount = 3;
  systemMonitorTopProcessSortBy = "cpu";
  systemMonitorGraphInterval = 60;
  systemMonitorLayoutMode = "auto";
  systemMonitorX = -1;
  systemMonitorY = -1;
  systemMonitorWidth = 320;
  systemMonitorHeight = 480;
  systemMonitorDisplayPreferences = [
    "all"
  ];
  systemMonitorVariants = [ ];
  desktopWidgetPositions = { };
  desktopWidgetGridSettings = { };
  desktopWidgetInstances = [ ];
  desktopWidgetGroups = [ ];
  builtInPluginSettings = {
    dms_settings_search = {
      trigger = "?";
    };
  };
  configVersion = 5;
}
