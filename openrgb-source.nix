{
  lib,
  stdenv,
  fetchFromGitLab,
  libusb1,
  hidapi,
  pkg-config,
  coreutils,
  mbedtls,
  symlinkJoin,
  qt5,
  openal
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "openrgb";
  version = "0.9-git";

  src = fetchFromGitLab {
    owner = "CAlcProgrammer1";
    repo = "OpenRGB";
    rev = "b0a08c7d10a4b32791e4bb7f4397bbc46eb68997";
    hash = "sha256-fZEvfWFCPaiPS7Byq7fhWxdOmQFKgTXvokvyZMkCU4E=";
  };

  nativeBuildInputs = [
    pkg-config
    qt5.qmake
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    openal
    libusb1
    hidapi
    mbedtls
    qt5.qtbase
    qt5.qttools
  ];

  postPatch = ''
    patchShebangs scripts/build-udev-rules.sh
    
    # Fix /usr/bin/env in generated udev rules
    substituteInPlace scripts/build-udev-rules.sh \
      --replace-fail '/usr/bin/env chmod' '${coreutils}/bin/chmod'
  '';

  configurePhase = ''
    runHook preConfigure
    qmake OpenRGB.pro PREFIX=$out
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    make -j$NIX_BUILD_CORES
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    make install
    runHook postInstall
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    runHook preInstallCheck

    HOME=$TMPDIR $out/bin/openrgb --help > /dev/null

    runHook postInstallCheck
  '';

  meta = {
    description = "Open source RGB lighting control (built from source)";
    homepage = "https://gitlab.com/CalcProgrammer1/OpenRGB";
    maintainers = with lib.maintainers; [ ];
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.linux;
    mainProgram = "openrgb";
  };
})
