{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    # To make qtWebEngine happy on later linex kernels.
    # See https://github.com/NixOS/nixpkgs/issues/508998#issuecomment-4248663189
    QTWEBENGINE_FORCE_USE_GBM = "0";
    # HTTP_PROXY = "http://localhost:10809";
    # HTTPS_PROXY = "http://localhost:10809";
    # ALL_PROXY = "socks5://localhost:10809";
    HTTP_PROXY = "http://localhost:7897";
    HTTPS_PROXY = "http://localhost:7897";
    ALL_PROXY = "socks5://localhost:7897";
    NO_PROXY = "localhost,127.0.0.1";
  };
}
