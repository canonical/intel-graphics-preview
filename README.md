# Intel Graphics Preview
## About
This project represents a collaboration between Intel and Canonical to enable the latest Intel hardware with newer graphics package versions than might be available in the latest Ubuntu release. 

## Install LNL and BMG Graphics Stack
**Current Phase of Enablement:** Testing
The following instructions reflect the current best known configuration for machines running Intel Lunar Lake or Battlemage hardware. 

 ### Oracular
```
sudo add-apt-repository ppa:kobuk-team/intel-graphics-testing
sudo apt update
sudo apt upgrade

sudo apt install igsc intel-igc-cm libigdgmm12 libigc1 intel-level-zero-gpu-raytracing intel-media-va-driver intel-onetbb libze1 vainfo libvpl2 libvpl-tools libmetee4 intel-metrics-discovery intel-metrics-library libmfx-gen1.2 xpu-smi linux-intel
```
Now we just need to do a quick reboot!
```
sudo reboot
```
