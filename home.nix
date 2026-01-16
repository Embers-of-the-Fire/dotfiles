inputs@{
  config,
  pkgs,
  lib,
  ...
}:

let
  makeAppImage = import ./make-appimage.nix;
  qgc = makeAppImage {
    pname = "qgroundcontrol";
    version = "5.0.8";
    url = "https://github.com/mavlink/qgroundcontrol/releases/download/v5.0.8/QGroundControl-x86_64.AppImage";
    hash = "sha256-BpacZ+9Y6gY97wqCcUR6HMOFQ4xKffNoEzFbRHUUZzc=";
    extraInstallCommands =
      { src, appimageContents }:
      ''
        install -m 444 -D ${appimageContents}/org.mavlink.qgroundcontrol.desktop -t $out/share/applications
        cp -r ${appimageContents}/usr/share/icons $out/share
        cp -r ${appimageContents}/QGroundControl.png $out/share
        substituteInPlace $out/share/applications/org.mavlink.qgroundcontrol.desktop \
          --replace 'Exec=QGroundControl' 'Exec=qgroundcontrol'
      '';
  } { inherit inputs; };
  latex = pkgs.texlive.combined.scheme-full;
in
{
  home.stateVersion = "24.11";

  imports = [
    ./dotfiles.nix
    ./fonts.nix
    ./vscode-settings.nix
    ./niri/config.dms.nix
  ];

  programs.fuzzel.enable = true;

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
  };

  programs.lazyvim = {
    enable = true;

    installCoreDependencies = true;

    extras = {
      lang.astro = {
        enable = true;
        installDependencies = true;
      };
      lang.clangd = {
        enable = true;
        installDependencies = true;
      };
      lang.dart.enable = true;
      lang.docker.enable = true;
      lang.git.enable = true;
      lang.go = {
        enable = true;
        installDependencies = true;
      };
      lang.haskell = {
        enable = true;
        installDependencies = true;
      };
      lang.json.enable = true;
      lang.kotlin.enable = true;
      lang.nix = {
        enable = true;
        installDependencies = true;
      };
      lang.python = {
        enable = true;
        installDependencies = true;
      };
      lang.rust.enable = true;
      lang.typescript = {
        enable = true;
        installDependencies = true;
      };
      lang.typst = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };
      lang.zig = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };

      coding.yanky.enable = true;
      coding.nvim-cmp.enable = true;

      # ai.copilot.enable = true;
      ai.copilot-chat.enable = true;

      editor.fzf.enable = true;
      editor.telescope.enable = true;
      editor.neo-tree = {
        enable = true;
        config = ''
          return {
            "nvim-neo-tree/neo-tree.nvim",
            opts = {
              filesystem = {
                hide_dotfiles = false,
              }
            }
          }
        '';
      };

      formatting.biome.enable = true;
    };

    configFiles = ./lazyvim;

    extraPackages = with pkgs; [
      nixd
      alejandra
      ruff
      pyright
      uv
      zls
      haskellPackages.haskell-debug-adapter
      markdownlint-cli2
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#ff00ff,bg=cyan,bold,underline";
      strategy = [
        "match_prev_cmd"
        "history"
        "completion"
      ];
    };
    syntaxHighlighting.enable = true;
    autocd = true;
    initContent =
      let
        fastfetch = lib.mkOrder 1600 "fastfetch";
        starship = lib.mkOrder 1500 "eval \"$(starship init zsh)\"";
      in
      lib.mkMerge [
        fastfetch
        starship
      ];
  };

  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = ''
      fastfetch
      eval "$(starship init fish)"
    '';
    shellAbbrs = {
      nix-switch = "sudo nixos-rebuild switch --flake /etc/nixos#";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    keymap = {
      mgr.prepend_keymap = [
        {
          run = [
            ''shell -- for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list''
            "yank"
          ];
          on = "y";
        }
      ];
    };
  };

  programs.rofi = {
    enable = true;
    cycle = true;
    location = "bottom";
  };

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    git = true;
    icons = "always";
  };

  programs.bat.enable = true;
  programs.btop.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
    ];
  };

  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  home.packages = with pkgs; [
    android-tools
    firefox-bin
    networkmanagerapplet
    kitty
    fastfetch
    starship
    ripgrep
    fd
    gnome-keyring
    kdePackages.kcalc
    kdePackages.ksystemlog
    wayland-utils
    wl-clipboard
    qutebrowser
    qq
    dust
    biome
    libnotify
    mpvpaper
    btop
    rustup
    nodejs
    pnpm
    uv
    xclip
    usbutils
    git-credential-manager
    xhost
    (feishu.override {
      commandLineArgs = ''
        --ozone-platform-hint=auto
        --enable-features=WaylandWindowDecorations
        --enable-wayland-ime=true
        --wayland-text-input-version=3
      '';
    })
    resources
    foxglove-studio
    mpv
    losslesscut-bin
    aria2
    qgc
    gcc15
    llvm_21
    zathura
    google-chrome
    btrfs-progs
    tree-sitter
    statix
    kdePackages.qtsvg
    kdePackages.ark
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.dolphin
    nautilus
    github-copilot-cli
    obsidian
    unrar
    pw-volume
    helvum
    clang-tools
    openjdk
    libreoffice
    jetbrains.idea
    jetbrains.webstorm
    jetbrains.pycharm
    jetbrains.clion
    jetbrains.goland
    jetbrains.rust-rover
    android-studio
    conda
    nixfmt
    postman
    ffmpeg
    gh
    go
    tokei
    syncthing
    sqlite
    sqlite-utils
    latex
    flutter
  ];
}
