{
  config,
  pkgs,
  lib,
  ...
}:
{
  i18n = {
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
    };
    supportedLocales = [
      "en_SG.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-chinese-addons
      kdePackages.fcitx5-qt
      fcitx5-gtk
    ];
    fcitx5.waylandFrontend = true;
  };
}
