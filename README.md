# LibreOffice Installation and Uninstallation Guide

This repository contains scripts for **installing** and **removing** LibreOffice, as well as configuring a customized theme for a better user interface. The installation script includes necessary dependencies, desktop icon setup, and the installation of the LibreOffice MS theme. If you wish to uninstall LibreOffice, you can use the provided script for a clean removal.



<a href="https://ko-fi.com/P5P013UUGZ">
    <img src="https://github.com/nuntius-dev/badips/raw/main/kofi.png" alt="comprar cafe" width="150" />
</a>

## Files
- **`install_libreoffice.sh`**: Script to install LibreOffice with necessary configurations and theme.
- **`uninstall_libreoffice.sh`**: Script to remove LibreOffice from the system.

## Installation Steps
1. **Clone the Repository**  
   Clone this repository to your local machine:
   ```bash
   git clone https://github.com/nuntius-dev/LibreOffice.git
   cd LibreOffice
   ```

2. **Run the Installation Script**  
   Execute the installation script to install LibreOffice and apply the custom MS theme:
   ```bash
   chmod +x install_libreoffice.sh
   ./install_libreoffice.sh
   ```

## Uninstallation Steps
If you need to uninstall LibreOffice, use the provided uninstallation script:
1. **Run the Uninstallation Script**  
   To completely remove LibreOffice from your system, execute:
   ```bash
   chmod +x uninstall_libreoffice.sh
   ./uninstall_libreoffice.sh
   ```

## Script Details

### `install_libreoffice.sh`
- **Installs** LibreOffice and its dependencies.
- **Configures** LibreOffice for use with the MS theme.
- **Sets up** a desktop icon for quick access.
- **Cleans up** temporary files to reduce the disk footprint.

### `uninstall_libreoffice.sh`
- **Removes** LibreOffice from the system, including any configuration and related dependencies.
- **Cleans up** the system by removing leftover files.

## Notes
- Ensure you have `sudo` privileges before running these scripts.
- After installation, LibreOffice will be ready for use with a customized MS-style theme.

## Support
For further questions or support, feel free to open an issue on the [GitHub repository](https://github.com/nuntius-dev/LibreOffice.git).
