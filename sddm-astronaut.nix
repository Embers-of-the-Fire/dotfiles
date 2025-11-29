{ pkgs, lib, stdenvNoCC, themeConfig ? null, embeddedTheme ? "astronaut", ... }:

let
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "3acfa1b9f643265bcccf524a86e5c4964c4ba52c";
    hash = "sha256-ee7ta/yiRieaZxitq5LQZ5dwAkGLVjjmnekXRu6yh5E=";
  };
in
stdenvNoCC.mkDerivation (finalAttrs: {
  inherit src;

  pname = "sddm-astronaut";
  version = "1.0-unstable";

  dontWrapQtApps = true;

  propagatedBuildInputs = with pkgs.kdePackages; [
    qtsvg
    qtmultimedia
    qtvirtualkeyboard
  ];

  installPhase =
    let
      iniFormat = pkgs.formats.ini { };
      configFile = iniFormat.generate "" { General = themeConfig; };
      basePath = "$out/share/sddm/themes/sddm-astronaut-theme";
      fontPath = "$out/share/fonts/";
      sedString = "ConfigFile=Themes/";
    in
      ''
        mkdir -p ${basePath}
        cp -r $src/* ${basePath}
        install -m444 -Dt $out/share/fonts $src/Fonts/**/*
      '' + lib.optionalString (embeddedTheme != "astronaut") ''
        sed -i "s|^${sedString}.*\\.conf$|${sedString}${embeddedTheme}.conf|" ${basePath}/metadata.desktop
      '' + lib.optionalString (themeConfig != null) ''
        chmod u+w ${basePath}/Themes/
        ln -sf ${configFile} ${basePath}/Themes/${embeddedTheme}.conf.user
      '';

  meta = {
    description = "Modern looking qt6 sddm theme";
    homepage = "https://github.com/${src.owner}/${src.repo}";
    license = lib.licenses.gpl3;
  };
})

