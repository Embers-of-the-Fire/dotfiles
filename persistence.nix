{ ... }:

{
  environment.persistence."/persistent" = {
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
    ];
    users.admin = {
      directories = [
        ".android"
        { directory = ".cache"; user = "admin"; group = "wheel"; mode = "0755"; }
        ".cmake"
        ".config/fcitx5"
        ".config/qutebrowser"
        ".config/OpenRGB"
        ".config/org.coolercontrol.CoolerConntrol"
        { directory = ".config"; user = "admin"; group = "wheel"; mode = "0755"; }
        ".copilot"
        ".docker"
        ".gnupg"
        ".gradle"
        ".java"
        ".local"
        ".mozilla"
        ".pki"
        ".ssh"
        ".steam"
        ".vscode"
        ".wine"
        "Desktop"
        "Develop"
        "Documents"
        "Downloads"
        "Environment"
        "Learn"
        "Music"
        "Pictures"
        "Public"
        "Templates"
        "Theme"
        "Videos"
      ];
      files = [
        ".bash_history"
        ".gitconfig"
        ".gtkrc-2.0"
        ".ideavimrc"
        ".wget-hsts"
        ".zcompdump"
        ".zsh_history"
      ];
    };
  };
}
