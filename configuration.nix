# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  rofi-launcher-variant = pkgs.writeShellScriptBin "rofi-launcher-variant" (
    builtins.readFile ./rofi/variant.sh
  );
  openrgb-source = pkgs.callPackage ./openrgb-source.nix { };
in
{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];
  imports = [
    ./environments.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./extra-fs.nix
    ./machine-dotfiles.nix
  ];

  programs.fuse = {
    enable = true;
    userAllowOther = true;
  };

  # Dirty hack to make UV happy
  programs.nix-ld.enable = true;

  # WM support
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --issue --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;input=red --cmd niri-session";
        user = "greetd";
      };
    };
  };
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardError = "journal";
    StandardInput = "tty";
    StandardOutput = "tty";
    TTYPath = "/dev/tty1";
    TTYReset = true;
    TTYVHangup = true;
    TTYVDisallocate = true;
  };

  # Mouse speed
  services.libinput.mouse.accelSpeed = "+1.0";

  # Accpet non-free licenses
  nixpkgs.config.allowUnfree = true;

  # nixpkgs mirror
  nix.settings.substitute = true;
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];

  # flakes support
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Storage optimization
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.settings.auto-optimise-store = true;

  boot.loader.efi.canTouchEfiVariables = true;
  # Use the grub EFI boot loader.
  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    efiSupport = true;
    device = "nodev";
    default = "saved";
  };
  distro-grub-themes = {
    enable = true;
    theme = "nixos";
  };
  boot.kernelParams = [
    "acpi_enforce_resources=lax"
    "video=DP-1:e"
  ];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [
    "coretemp"
    "nct6687"
  ];
  boot.extraModulePackages = with pkgs; [
    (linuxPackages_latest.nct6687d.overrideAttrs (oldAttrs: {
      version = "0-unstable-2025-11-29";
      src = fetchFromGitHub {
        owner = "Fred78290";
        repo = "nct6687d";
        rev = "15089b021875bf69381735e504268aaf269a5724";
        hash = "sha256-HRaB+Fy+u7kdyZFFr7hfKN8rz10hT1DW9bN7K5NW7FM=";
      };
    }))
  ];
  boot.extraModprobeConfig = ''
    options nct6687 fan_control=msi_alt1
  '';

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  programs.nm-applet.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
  services.blueman.enable = true;

  programs.adb.enable = true;

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
    autoStart = true;
  };
  systemd.services.clash-verge.enable = true;
  # networking.nameservers = [ "localhost:10809" ];
  programs.steam = {
    enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_SG.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  fonts.enableDefaultPackages = true;
  fonts.fontDir.enable = true;

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # polkit agent
  security.soteria.enable = true;

  # Secret service
  services.gnome.gnome-keyring.enable = true;

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.extraConfig.bluetoothEnhancements = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [
          "hsp_hs"
          "hsp_ag"
          "hfp_hf"
          "hfp_ag"
        ];
      };
    };
  };

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  # Keep display information when using sudo
  security.sudo.extraConfig = ''
    greetd ALL=(ALL:ALL) NOPASSWD:ALL

    Defaults:root,%wheel env_keep+=DISPLAY
    Defaults:root,%wheel env_keep+=XAUTHORITY
    Defaults:root,%wheel env_keep+=WAYLAND_DISPLAY
    Defaults:root,%wheel env_keep+=XDG_RUNTIME_DIR
  '';

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.niri ];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable shell
  programs.zsh.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.groups.iio = { };
  users.groups.plugdev = { };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "docker"
      "video"
      "iio"
      "plugdev"
    ]; # Enable ‘sudo’ for the user.
  };
  users.users.greetd = {
    isNormalUser = true;
    shell = pkgs.bash;
    group = "video";
    extraGroups = [
      "wheel"
      "video"
    ];
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "Embers-of-the-Fire";
      user.emal = "stellarishs@163.com";
      credential = {
        helper = "manager";
        "https://github.com".username = "Embers-of-the-Fire";
        credentialStore = "cache";
      };
    };
  };

  # Power management
  services.tuned.enable = true;
  services.upower.enable = true;

  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    package = openrgb-source;
  };
  systemd.services.openrgb.before = [
    "display-manager.service"
    "greetd.service"
  ];

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    jq
    file
    wget
    xrandr
    lm_sensors
    liquidctl
    xwayland-satellite
    rofi-launcher-variant
    gtkgreet
    alacritty
    libGL
  ];

  programs.coolercontrol.enable = true;
  systemd.services.coolercontrol = {
    wantedBy = [ "multi-user.target" ];
    before = [
      "display-manager.service"
      "greetd.service"
    ];
    after = [ "network.target" ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = ''
                set number
        	    set relativenumber
      '';
    };
  };

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    fira-code-symbols
    wqy_microhei
    dejavu_fonts
    roboto
    jetbrains-mono
    open-sans
    maple-mono.CN
    maple-mono.NF-CN
    maple-mono.NF
    maple-mono.truetype
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Docker
  virtualisation.docker.enable = true;
  systemd.services.docker.environment = {
    HTTP_PROXY = "http://127.0.0.1:7897";
    HTTPS_PROXY = "http://127.0.0.1:7897";
    NO_PROXY = "localhost,127.0.0.1";
  };

  # Nix proxy
  systemd.services.nix-daemon.environment = {
    http_proxy = "http://localhost:7897";
    https_proxy = "http://localhost:7897";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  environment.etc."issue".text = ''
    <<< Welcome to ${config.system.nixos.distroName} ${config.system.nixos.label} >>>
  '';

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
