{
  config,
  pkgs,
  lib,
  ...
}:

{
  xdg.configFile = {
    "starship.toml".source = ./starship.toml;
  };
  home.file = {
    ".codex/AGENTS.md".source = ./agents/AGENTS.md;
    ".claude/CLAUDE.md".source = ./agents/AGENTS.md;
  };
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
    "application/x-7z-compressed" = "org.kde.ark.desktop";
    "application/pdf" = "org.pwmt.zathura.desktop";
  };
}
