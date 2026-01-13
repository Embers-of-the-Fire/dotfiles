{ pkgs, ... }:

{
  programs.niri.settings = {
    input = {
      keyboard = {
        xkb = { };
        numlock = false;
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      mouse.enable = true;
      trackpoint.enable = true;

      focus-follows-mouse.max-scroll-amount = "0%";
    };

    outputs = {
      "DP-1" = {
        mode = {
          height = 3840;
          width = 2160;
          refresh = 144.0;
        };
        scale = 1.5;
        position = {
          x = 2560;
          y = 500;
        };
        focus-at-startup = true;
      };

      "DP-2" = {
        mode = {
          height = 3840;
          width = 2160;
          refresh = 60.0;
        };
        scale = 1.5;
        position = {
          x = 0;
          y = 510;
        };
      };

      "HDMI-A-2" = {
        mode = {
          height = 1440;
          width = 2560;
          refresh = 100.0;
        };
        scale = 1.2;
        transform.rotation = 90;
        position = {
          x = 5120;
          y = 0;
        };

        # Not currently implemented.
        # See issue https://github.com/sodiboo/niri-flake/issues/1493 for status.
        #
        # layout = {
        #   default-column-width.proportion = 1.0;
        # };
      };

      "HDMI-A-1" = {
        mode = {
          height = 1200;
          width = 1920;
          refresh = 60.0;
        };
        scale = 1.0;
        position = {
          x = 5120;
          y = 2134;
        };

        # Not currently implemented.
        # See issue https://github.com/sodiboo/niri-flake/issues/1493 for status.
        #
        # layout = {
        #   default-column-width.proportion = 1.0;
        # };
      };
    };

    layout = {
      background-color = "transparent";
      gaps = 16;
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
      ];
      preset-window-heights = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
        { proportion = 1.0; }
      ];

      default-column-width.proportion = 1.0 / 2.0;

      focus-ring.enable = false;
      border = {
        enable = true;
        width = 2;
        active.color = "#f38ba8";
        inactive.color = "#5b4e65";
      };

      shadow = {
        enable = true;
        draw-behind-window = false;
        softness = 10;
        spread = 3;
        offset = {
          x = 0;
          y = 2;
        };
        color = "#00000080";
        inactive-color = "#00000060";
      };

      insert-hint = {
        display = {
          gradient = {
            from = "#ffbb6680";
            to = "#ffc88080";
            angle = 45;
            relative-to = "workspace-view";
          };
        };
      };

      tab-indicator = {
        enable = true;
        hide-when-single-tab = true;
        place-within-column = true;
        gap = 5;
        width = 4;
        length.total-proportion = 1.0;
        position = "left";
        gaps-between-tabs = 2;
        corner-radius = 8;
        active.color = "#bf616a";
        inactive.color = "#d08770";
      };

      struts = { };
    };

    overview = {
      backdrop-color = "transparent";
      workspace-shadow.enable = false;
    };

    spawn-at-startup = [
      {
        argv = [
          "syncthing"
          "serve"
          "--no-browser"
        ];
      }
      {
        argv = [
          "fish"
          "-c"
          "$HOME/.config/niri/wallpaper.fish"
        ];
      }
    ];

    hotkey-overlay.hide-not-bound = true;

    screenshot-path = "~/Pictures/Screenshots/Screenshot_from_%Y-%m-%d_%H-%M-%S.png";

    animations.enable = true;

    layer-rules = [
      {
        matches = [ { namespace = "^mpvpaper$"; } ];
        place-within-backdrop = true;
      }
    ];

    window-rules = [
      {
        matches = [ { app-id = "^org\\.wezfurlong\\.wezterm\$"; } ];
        default-column-width = { };
      }
      {
        matches = [ { app-id = "firefox\$"; } ];
        open-floating = true;
      }
      {
        matches = [ { app-id = "[wW]ine\$"; } ];
        open-floating = true;
      }
      {
        matches = [ { title = "[Aa]ccept [Aa]ll [Cc]hanges\$"; } ];
        open-floating = true;
      }
      {
        matches = [
          { title = "Chill With You"; }
          { app-id = "steam_app_3548580"; }
        ];
        default-column-width.proportion = 1.0;
        default-window-height.proportion = 1.0;
      }
    ];

    binds = {
      "Mod+Shift+Splash".action.show-hotkey-overlay = true;
      "Mod+T" = {
        hotkey-overlay.title = "Open a Terminal: alacritty";
        action.spawn = [ "alacritty" ];
      };
      "Mod+E" = {
        hotkey-overlay.title = "Run Dolphin: File Manager";
        action.spawn = [ "dolphin" ];
      };
      "Mod+O" = {
        repeat = false;
        action.toggle-overview = true;
      };
      "Mod+Q" = {
        repeat = false;
        action.close-window = true;
      };

      "Mod+Left".action.focus-column-left = true;
      "Mod+Down".action.focus-window-down = true;
      "Mod+Up".action.focus-window-up = true;
      "Mod+Right".action.focus-column-right = true;
      "Mod+H".action.focus-column-left = true;
      "Mod+J".action.focus-window-down = true;
      "Mod+K".action.focus-window-up = true;
      "Mod+L".action.focus-column-right = true;

      "Mod+Ctrl+Left".action.move-column-left = true;
      "Mod+Ctrl+Down".action.move-window-down = true;
      "Mod+Ctrl+Up".action.move-window-up = true;
      "Mod+Ctrl+Right".action.move-column-right = true;
      "Mod+Ctrl+H".action.move-column-left = true;
      "Mod+Ctrl+J".action.move-window-down = true;
      "Mod+Ctrl+K".action.move-window-up = true;
      "Mod+Ctrl+L".action.move-column-right = true;

      "Mod+Home".action.focus-column-first = true;
      "Mod+End".action.focus-column-last = true;
      "Mod+Ctrl+Home".action.move-column-to-first = true;
      "Mod+Ctrl+End".action.move-column-to-last = true;

      "Mod+Shift+Left".action.focus-monitor-left = true;
      "Mod+Shift+Down".action.focus-monitor-down = true;
      "Mod+Shift+Up".action.focus-monitor-up = true;
      "Mod+Shift+Right".action.focus-monitor-right = true;
      "Mod+Shift+H".action.focus-monitor-left = true;
      "Mod+Shift+J".action.focus-monitor-down = true;
      "Mod+Shift+K".action.focus-monitor-up = true;
      "Mod+Shift+L".action.focus-monitor-right = true;

      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = true;
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = true;
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = true;
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = true;
      "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = true;
      "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = true;
      "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = true;
      "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = true;

      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;

      "Mod+Ctrl+1".action.move-column-to-workspace = 1;
      "Mod+Ctrl+2".action.move-column-to-workspace = 2;
      "Mod+Ctrl+3".action.move-column-to-workspace = 3;
      "Mod+Ctrl+4".action.move-column-to-workspace = 4;
      "Mod+Ctrl+5".action.move-column-to-workspace = 5;
      "Mod+Ctrl+6".action.move-column-to-workspace = 6;
      "Mod+Ctrl+7".action.move-column-to-workspace = 7;
      "Mod+Ctrl+8".action.move-column-to-workspace = 8;
      "Mod+Ctrl+9".action.move-column-to-workspace = 9;

      "Mod+Page_Down".action.focus-workspace-down = true;
      "Mod+Page_Up".action.focus-workspace-up = true;
      "Mod+U".action.focus-workspace-down = true;
      "Mod+I".action.focus-workspace-up = true;
      "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = true;
      "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = true;
      "Mod+Ctrl+U".action.move-column-to-workspace-down = true;
      "Mod+Ctrl+I".action.move-column-to-workspace-up = true;

      "Mod+Shift+Page_Down".action.move-workspace-down = true;
      "Mod+Shift+Page_Up".action.move-workspace-up = true;
      "Mod+Shift+U".action.move-workspace-down = true;
      "Mod+Shift+I".action.move-workspace-up = true;

      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = true;
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = true;
      };
      "Mod+Ctrl+WheelScrollDown" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-down = true;
      };
      "Mod+Ctrl+WheelScrollUp" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-up = true;
      };

      "Mod+WheelScrollRight".action.focus-column-right = true;
      "Mod+WheelScrollLeft".action.focus-column-left = true;
      "Mod+Ctrl+WheelScrollRight".action.move-column-right = true;
      "Mod+Ctrl+WheelScrollLeft".action.move-column-left = true;

      "Mod+Shift+WheelScrollDown".action.focus-column-right = true;
      "Mod+Shift+WheelScrollUp".action.focus-column-left = true;
      "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = true;
      "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = true;

      "Mod+BracketLeft".action.consume-or-expel-window-left = true;
      "Mod+BracketRight".action.consume-or-expel-window-right = true;

      "Mod+Comma".action.consume-window-into-column = true;
      "Mod+Period".action.expel-window-from-column = true;

      "Mod+B" = {
        hotkey-overlay.title = "Open a Browser: qutebrowser";
        action.spawn = [ "qutebrowser" ];
      };

      "Mod+R".action.switch-preset-column-width = true;
      "Mod+Shift+R".action.switch-preset-window-height = true;
      "Mod+Ctrl+R".action.reset-window-height = true;
      "Mod+F".action.maximize-column = true;
      "Mod+Shift+F".action.fullscreen-window = true;

      "Mod+Ctrl+F".action.expand-column-to-available-width = true;

      "Mod+C".action.center-column = true;

      "Mod+Ctrl+C".action.center-visible-columns = true;

      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";

      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      "Mod+V".action.toggle-window-floating = true;
      "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = true;

      "Mod+W".action.toggle-column-tabbed-display = true;

      "Mod+Space".action.switch-layout = "next";
      "Mod+Shift+Space".action.switch-layout = "prev";

      "Print".action.screenshot = true;
      "Alt+A".action.screenshot = true;
      "Ctrl+Print".action.screenshot-screen = true;
      "Ctrl+Alt+A".action.screenshot-screen = true;
      "Alt+Print".action.screenshot-window = true;
      "Shift+Alt+A".action.screenshot-window = true;

      "Mod+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = true;
      };

      "Mod+Shift+P" = {
        hotkey-overlay.title = "Power off monitors";
        action.power-off-monitors = true;
      };
    };
  };
}
