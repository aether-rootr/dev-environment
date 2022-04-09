#!/usr/bin/env bash

set -ex

docker build --no-cache --network=host -t dev:latest .