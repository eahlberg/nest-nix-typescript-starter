{ pkgs ? import (builtins.fetchTarball {
  url =
    # Wed Oct 18 03:09:52 PM CEST 2023
    "https://github.com/NixOS/nixpkgs/archive/898cb2064b6e98b8c5499f37e81adbdf2925f7c5.tar.gz";
}) { } }:
pkgs.mkShell { nativeBuildInputs = with pkgs.buildPackages; [ nodejs ]; }
