{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    # HTTP_PROXY = "http://localhost:10809";
    # HTTPS_PROXY = "http://localhost:10809";
    # ALL_PROXY = "socks5://localhost:10809";
    HTTP_PROXY = "http://localhost:7897";
    HTTPS_PROXY = "http://localhost:7897";
    ALL_PROXY = "socks5://localhost:7897";
    NO_PROXY = "localhost,127.0.0.1";
    FLUTTER_ROOT = "${pkgs.flutter}";
  };
}
