{ ... }:

{
  home.persistence."/persistent/home/admin" = {
    directories = [
      ".android"
      ".cmake"
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
      ".copilot/config.json"
      ".gitconfig"
      ".gtkrc-2.0"
      ".ideavimrc"
      ".wget-hsts"
      ".zcompdump"
      ".zsh_history"
    ];
    allowOther = true;
  };
}
