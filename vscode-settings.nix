{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        enableExtensionUpdateCheck = true;
        enableUpdateCheck = false;
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          yzhang.markdown-all-in-one
          biomejs.biome
          ms-ceintl.vscode-language-pack-zh-hans
          streetsidesoftware.code-spell-checker
          w88975.code-translate
          fill-labs.dependi
          usernamehw.errorlens
          tamasfe.even-better-toml
          oderwat.indent-rainbow
          ms-toolsai.jupyter
          pkief.material-icon-theme
        ];
        globalSnippets = {
          fixme = {
            body = [ "$LINE_COMMENT FIXME: $0" ];
            description = "Insert a FIXME remark";
            prefix = [ "fixme" ];
          };
          todo = {
            body = [ "$LINE_COMMENT TODO: $0" ];
            description = "Insert a TODO remark";
            prefix = [ "TODO" ];
          };
        };
        userSettings = {
          "update.mode" = "none";
          "workbench.colorTheme" = "Solarized Dark";
          "github.copilot.nextEditSuggestions.enabled" = true;
          "remote.autoForwardPortsSource" = "hybrid";
          "vim.handleKeys" = {
            "<C-d>" = false;
            "<C-s>" = false;
            "<C-z>" = false;
            "<C-c>" = false;
            "<C-v>" = false;
            "<C-x>" = false;
            "<C-f>" = false;
          };
        };
      };
    };
  };
}

