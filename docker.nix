{ pkgs ? import (builtins.fetchTarball {
  url =
    # Wed Oct 18 03:09:52 PM CEST 2023
    "https://github.com/NixOS/nixpkgs/archive/898cb2064b6e98b8c5499f37e81adbdf2925f7c5.tar.gz";
}) { } }:
let
  bundle = import ./. { };
  imageName = "nest-nix-example";
  imageCmd = [ "node" "${bundle}/dist/main.js" ];
in pkgs.dockerTools.buildImage {
  name = imageName;
  copyToRoot = pkgs.buildEnv {
    name = imageName;
    paths = [
      (pkgs.buildEnv {
        name = imageName;
        paths = with pkgs; [ nodejs ];
      })
    ];
  };
  config = { Cmd = imageCmd; };
  created = "now";
}
