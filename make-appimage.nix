{ pname, version, url, hash, extraInstallCommands ? null }: { inputs }:

let
  pkgs = inputs.pkgs;
  src = pkgs.fetchurl { inherit url hash; };
  appimageContents = pkgs.appimageTools.extract { inherit pname version src; };
in
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    pkgs = pkgs;
    extraInstallCommands = if extraInstallCommands == null then ''
      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${appimageContents}/usr/share/icons $out/share
    '' else extraInstallCommands { inherit src appimageContents; };

    extraBwrapArgs = [
      "--bind-try /etc/nixos/ /etx/nixos/"
    ];

    dieWithParent = false;

    extraPkgs = pkgs: with pkgs; [ ];
  }

