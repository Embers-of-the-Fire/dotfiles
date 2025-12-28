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
  pipewire,
<<<<<<< HEAD
  openal
=======
  openal,
>>>>>>> e467f61 (sync)
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "openrgb";
<<<<<<< HEAD
  version = "0.9-git";
=======
  version = "1.0-rc-git";
>>>>>>> e467f61 (sync)

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
    pipewire
    mbedtls
    qt5.qtbase
    qt5.qttools
  ];

  postPatch = ''
    patchShebangs scripts/build-udev-rules.sh
<<<<<<< HEAD
    
=======

>>>>>>> e467f61 (sync)
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

  postFixup = ''
    wrapQtApp $out/bin/openrgb \
<<<<<<< HEAD
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ openal pipewire ]}
=======
      --prefix LD_LIBRARY_PATH : ${
        lib.makeLibraryPath [
          openal
          pipewire
        ]
      }
>>>>>>> e467f61 (sync)
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
