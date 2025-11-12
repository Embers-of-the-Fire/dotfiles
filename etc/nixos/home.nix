{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.11";

  imports = [
    ./dotfiles.nix
    ./fonts.nix
    ./vscode-settings.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Embers-of-the-Fire";
      user.emal = "stellarishs@163.com";
    };
  };

  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar.enable = true;
  programs.neovim.enable = true;
  
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-nix vim-airline ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set number relativenumber
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#ff00ff,bg=cyan,bold,underline";
      strategy = [ "match_prev_cmd" "history" "completion" ];
    };
    syntaxHighlighting.enable = true;
    autocd = true;
    initContent =
      let
        fastfetch = lib.mkOrder 1600 "fastfetch";
        starship = lib.mkOrder 1500 "eval \"$(starship init zsh)\"";
      in
        lib.mkMerge [ fastfetch starship ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    keymap = {
      mgr.prepend_keymap = [
        { run = [ ''shell -- for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list'' "yank" ]; on = "y"; }
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
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = "always";
  };

  programs.bat.enable = true;

  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  home.packages = with pkgs; [
    swaybg
    firefox-bin
    xwayland-satellite
    kitty
    fastfetch
    starship
    ripgrep
    fd
    nautilus
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
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.pycharm-professional [ "github-copilot" ])
  ];
}

