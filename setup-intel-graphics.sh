#!/bin/bash

SUPPORTED_DISTRO="ubuntu"
. /etc/os-release

[[ "${ID}" != "${SUPPORTED_DISTRO}" ]] && echo "These packages are only supported on ${SUPPORTED_DISTRO}" && exit 1

sudo apt-get update && sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:kobuk-team/intel-graphics
sudo apt-get update

sudo apt-get install -y intel-gsc libigdgmm12 libigc2 libze-intel-gpu-raytracing intel-media-va-driver-non-free \
	libze1 vainfo libvpl2 libvpl-tools intel-metrics-discovery intel-metrics-library libmfx-gen1 \
	xpu-smi intel-opencl-icd libze-intel-gpu1

echo -e "\e[1;33m   Installation of Intel graphics stack complete!  \e[0m"

if [[ "${VERSION_ID}" == "24.04" ]] || [[ "${VERSION_ID}" == "25.04" ]]; then
  echo -e "\e[1;33m⚠️  Would you like to install the kobuk linux-intel kernel? ⚠️\e[0m"
  sudo apt-get install linux-intel
fi

