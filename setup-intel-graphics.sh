#!/bin/bash

INSTALL_KERNEL=""
KERNEL_INSTALL_PROMPT="true"

while [[ $# -gt 0 ]]; do
  case $1 in
    --install-kernel)
      INSTALL_KERNEL="yes"
      KERNEL_INSTALL_PROMPT="false"
      shift
      ;;
    --no-install-kernel)
      INSTALL_KERNEL="no"
      KERNEL_INSTALL_PROMPT="false"
      shift
      ;;
    *)
      shift
      ;;
  esac
done

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
  if [[ "$KERNEL_INSTALL_PROMPT" == "true" ]]; then
    read -p $'\e[1;33m⚠️  Would you like to install the kobuk linux-intel kernel? ⚠️\e[0m (y/n): ' -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      sudo apt-get install linux-intel -y
    else
      echo "Skipping linux-intel kernel installation."
    fi
  else
    echo "Noninteractive install flag set"
    if [[ "$INSTALL_KERNEL" == "yes" ]]; then
      echo "Installing linux-intel kernel"
      sudo apt-get install linux-intel -y
    else
      echo "Skipping linux-intel kernel installation."
    fi
  fi
fi
