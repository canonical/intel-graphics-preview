#!/bin/bash

SUPPORTED_DISTRO="Ubuntu"
distro="Ubuntu"
os_release="24.04"

if ! command -v lsb_release >/dev/null 2>&1
then
  echo "lsb_release command not found, assuming ${distro} ${os_release} host."
else
  distro=$(lsb_release -is)
  os_release=$(lsb_release -rs)
fi

[[ "${distro}" != "${SUPPORTED_DISTRO}" ]] && echo "These packages are only supported on ${SUPPORTED_DISTRO}" && exit 1

sudo add-apt-repository ppa:kobuk-team/intel-graphics
sudo apt update
sudo apt upgrade

sudo apt install intel-gsc libigdgmm12 libigc2 libze-intel-gpu-raytracing intel-media-va-driver-non-free libze1 vainfo libvpl2 libvpl-tools libmetee4 intel-metrics-discovery intel-metrics-library libmfx-gen1 libxpum-dev libtbb12 libtbbmalloc2 intel-opencl-icd libze-intel-gpu1

echo "Installation of Intel graphics stack complete!"

if [[ "${os_release}" == "24.04" ]] || [[ "${os_release}" == "24.10" ]]; then
  sudo apt install linux-intel
  echo "Installation of linux-intel kernel complete! Please reboot now."
fi

