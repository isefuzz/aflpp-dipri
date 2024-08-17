#!/bin/bash

set -x

# Assume you are under root privilege.
# Install dependencies
apt-get update
apt-get install -y build-essential python3-dev automake cmake git flex bison libglib2.0-dev libpixman-1-dev python3-setuptools libgtk-3-dev
apt-get install -y lld llvm llvm-dev clang
apt-get install -y gcc-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-plugin-dev libstdc++-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-dev

# Build and check whether the build has succeeded.
make
ls -lh afl-fuzz afl-cc
