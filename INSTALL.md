# OPNDeploy Installation Guide

This guide will walk you through the process of installing and setting up OPNDeploy on your system. The current installation method involves downloading the latest ISO release and creating a bootable USB drive using Rufus.

## Prerequisites

- A USB drive with at least 8 GB of storage
- [Rufus](https://rufus.ie/) (or any other preferred USB imaging tool)

## Installation Steps

1. **Download the latest OPNDeploy ISO**: Visit the [Releases page](https://github.com/LordMordon/OPNDeploy/releases) on our GitHub repository and download the latest ISO release.

2. **Create a bootable USB drive**:

   a. Plug your USB drive into your computer.

   b. Open Rufus (or your preferred USB imaging tool).

   c. In Rufus, select your USB drive from the "Device" dropdown menu.

   d. In the "Boot selection" section, click the "Select" button and choose the downloaded OPNDeploy ISO file.

   e. Make sure the "Partition scheme" is set to "MBR" and the "Target system" is set to "BIOS or UEFI."

   f. Click the "Start" button to begin the process. Rufus will display a warning that all data on the USB drive will be destroyed. Make sure to back up any important files before proceeding.

   g. Wait for the process to complete. Rufus will display a "READY" message when the bootable USB drive has been successfully created.

3. **Boot from the USB drive**:

   a. Insert the bootable USB drive into the target system.

   b. Restart the target system and access the BIOS or UEFI settings (usually by pressing a specific key, such as F2, F10, or DEL, during the boot process).

   c. Change the boot order to prioritize booting from the USB drive.

   d. Save your changes and exit the BIOS or UEFI settings. The system should now boot from the USB drive and launch OPNDeploy.

4. **Use OPNDeploy**: Follow the on-screen instructions to create, customize, and deploy Windows images using OPNDeploy.

## Troubleshooting

If you encounter issues during the installation process, please consult our [documentation](./DOCS.md) and [Website](https://opndeploy.com) for assistance. You can also [submit an issue](https://github.com/LordMordon/OPNDeploy/issues) on our GitHub repository with details about your problem.

