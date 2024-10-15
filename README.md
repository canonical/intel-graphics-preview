# Intel Graphics Preview

## 1. Introduction
This project is a collaboration between Intel and Canonical to provide early preview of kernel and userspace support for new Intel GPUs.  Some components are directly from Ubuntu archives and some are from a [PPA](https://launchpad.net/~kobuk-team/+archive/ubuntu/intel-graphics).  

While the mainline Ubuntu 24.10 kernel already has much of the support, we are using the `linux-intel` kernel from the PPA at this time because of some additional patches that have not landed in the mainline kernel yet.

## 2. Report an Issue
Please submit issues [here](https://github.com/canonical/intel-graphics-preview/issues) and we'll get back to you ASAP.

## 3. Supported Intel GPUs
This preview supports up to and including the following:
* Lunar Lake (LNL)
* Battle Mage (BMG) (Initial support)

## 4. Supported Ubuntu Versions
* Ubuntu 24.10 Desktop 

## 5. Setup System and Install Graphics Stack

### 5.1 Install Ubuntu 24.10 Desktop

1. Download and install [Ubuntu 24.10 Desktop](https://releases.ubuntu.com/24.10/) on the host machine.

### 5.2 Install Graphics Stack

1. Clone this repo.

   ```bash
   git clone https://github.com/canonical/intel-graphics-preview.git
   ```

2. Run script to install the stack.

   ```bash
   cd intel-graphics-preview
   ./setup-intel-graphics.sh
   ```

3. Reboot.

## 6. Additional Resources
* [Intel Client GPUs Guide](https://dgpu-docs.intel.com/driver/client/overview.html)
