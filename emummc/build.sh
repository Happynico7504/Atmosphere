#!/bin/bash

set -e

git clone https://github.com
cd hactool
cp config.mk.template config.mk
make
sudo make install

cd ..

make clean
make -j
hactool -t kip emummc.kip --uncompressed emummc_unpacked.kip
python tools/kip1converter.py emummc_unpacked.kip emummc.data
cat emummc.caps emummc.data > emummc.kipm
