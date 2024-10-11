#!/bin/bash

sudo add-apt-repository ppa:kobuk-team/intel-graphics
sudo apt update
sudo apt upgrade

sudo apt install intel-gsc libigdgmm12 libigc1 intel-level-zero-gpu-raytracing intel-media-va-driver libze1 vainfo libvpl2 libvpl-tools libmetee4 intel-metrics-discovery intel-metrics-library libmfx-gen1.2 libxpum-dev libtbb12  libtbbmalloc2 linux-intel

echo "Installation complete! Please reboot now."

