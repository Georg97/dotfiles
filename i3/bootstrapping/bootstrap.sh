#!/bin/bash

# prepare directory for build
mkdir -p ./build
cd build

# install xkblayout-state
git clone https://github.com/nonpop/xkblayout-state xkblayout-state
cd xkblayout-state
make && sudo make install

