{ 
  pkgs ? import <nixpkgs> {},
}:
let
  github_src = pkgs.fetchFromGitHub {
    owner = "rancher-sandbox";
    repo = "rancher-desktop";
    rev = "v1.16.0";
    sha256 = "nwOsn/R4EsPQEv3bSRFqjvGJ/WDAMR+1CgVVtf5JYSk=";
  };
in pkgs.stdenv.mkDerivation (finalAttrs: {
  name = "rancher-desktop";

  src = github_src;
  yarnOfflineCache = pkgs.fetchYarnDeps {
    yarnLock = finalAttrs.src + "/yarn.lock";
    hash = "sha256-mo8urQaWIHu33+r0Y7mL9mJ/aSe/5CihuIetTeDHEUQ=";
  };

  buildInputs = with pkgs; [
    nodejs_18
    (yarn.override {
      nodejs = nodejs_18;
    })
  ];

  nativeBuildInputs = [
    yarnConfigHook
    yarnBuildHook
    # Needed for executing package.json scripts
    pkgs.nodejs_18
  ];

  buildPhase = ''
   yarn build
   yarn package
  '';
})
