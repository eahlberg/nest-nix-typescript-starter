#!/usr/bin/env bash
docker load < "$(nix-build --no-out-link docker.nix)"
IMAGE_ID=$(docker images | grep "nest-nix-example"| head -n 1 | awk '{print $1":"$2}')
docker run --network host "$IMAGE_ID"
