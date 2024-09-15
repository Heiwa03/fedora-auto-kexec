# Fedora Auto Kexec Script

## Description
This script automates the process of rebooting into a new kernel using `kexec` on Fedora systems. It retrieves the current initrd, kernel, and command line arguments using `grubby` and then uses `kexec` to load and execute the new kernel.

## Prerequisites
- Fedora operating system
- `grubby` installed
- `kexec-tools` installed

## Usage
1. Make the script executable:
    ```bash
    chmod +x fedora-auto-kexec.sh
    ```
2. Run the script with root privileges:
    ```bash
    sudo ./fedora-auto-kexec.sh
    ```
    Additionally, you can add the following line to your `.bashrc` file to simplify things
    ```bash
    alias autokexec="sudo ./.autokexec.sh"
    ```

## Example
```bash
sudo ./fedora-auto-kexec.sh