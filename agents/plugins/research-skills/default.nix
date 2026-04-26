{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "research-skills";
  version = "unstable-2026-04-24";

  src = fetchFromGitHub {
    owner = "Embers-of-the-Fire";
    repo = "agent-research-skills-opencode";
    rev = "1aed800a1c816c42573f0ebdeb2d0159214b9895";
    hash = "sha256-CJmV9anNQi5TZMWeZ7B8V8r4E3RI4iuGMKRd99+4A3M=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/opencode
    cp -r .opencode/commands $out/share/opencode/
    cp -r .opencode/skills $out/share/opencode/

    runHook postInstall
  '';

  meta = {
    description = "OpenCode research commands and skills bundle";
    homepage = "https://github.com/Embers-of-the-Fire/agent-research-skills-opencode";
    license = lib.licenses.unfree;
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
}
