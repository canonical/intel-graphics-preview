#!/bin/bash

sudo add-apt-repository ppa:kobuk-team/intel-graphics-testing
sudo apt update
sudo apt upgrade

sudo apt install -y igsc intel-igc-cm libigdgmm12 libigc1 intel-level-zero-gpu-raytracing intel-media-va-driver intel-onetbb libze1 vainfo libvpl2 libvpl-tools libmetee4 intel-metrics-discovery intel-metrics-library libmfx-gen1.2 xpu-smi linux-intel

echo "Installation complete! Please reboot now"

