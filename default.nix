{ pkgs ? import (builtins.fetchTarball {
  url =
    # Wed Oct 18 03:09:52 PM CEST 2023
    # buildNpmPackage was introduced in a release which uses node 18
    "https://github.com/NixOS/nixpkgs/archive/898cb2064b6e98b8c5499f37e81adbdf2925f7c5.tar.gz";
}) { } }:
pkgs.buildNpmPackage {
  pname = "nest-nix-example";
  version = "0.0.1";
  src = ./.;
  npmDepsHash = "sha256-brWU4nGHzw3ARt5pu5YmbX83QxFMJ/EhCeRCX1bF87o=";
  installPhase = ''
    runHook preInstall

    mkdir $out
    mv dist node_modules $out

    runHook postInstall
  '';
}
