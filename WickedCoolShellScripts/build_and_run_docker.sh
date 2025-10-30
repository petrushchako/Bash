#!/usr/bin/env bash

docker build -t bash-test .
docker run --rm bash-test