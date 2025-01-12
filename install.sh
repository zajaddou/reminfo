#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    /usr/bin/echo "This script must be run as root (with sudo)."
    exit 1
fi

# Check if reminfo is already installed
if dpkg-query -l | /usr/bin/grep -q "^ii  reminfo "; then
    /usr/bin/echo "reminfo is already installed."
    exit 0
fi

# Get the version from the control file
version=$(/usr/bin/awk '/Version/ {print $2}' package/DEBIAN/control)

# Banner and version info
/usr/bin/echo -e "\n
              
  ____   v:$version      _        __       
 |  _ \ ___ _ __ ___ (_)_ __  / _| ___  
 | |_) / _ \ '_ \` _ \| | '_ \| |_ / _ \ 
 |  _ <  __/ | | | | | | | | |  _| (_) |
 |_| \_\___|_| |_| |_|_|_| |_|_|  \___/
  
"

# List of dependencies to check and install
dependencies=(
  "bash"
  "libc6"
  "procps"
  "lsb-release"
)

sleep 0.2

# System update and upgrade
/usr/bin/echo -e " + System Update...\n"
/usr/bin/apt-get update -y > /dev/null 2>&1
/usr/bin/apt-get upgrade -y > /dev/null 2>&1

# Check and install dependencies
/usr/bin/echo " + Checking Dependencies..."
for dep in "${dependencies[@]}"; do
    if ! dpkg-query -W -f='${Status}' "$dep" 2>/dev/null | /usr/bin/grep -q "install ok installed"; then
        /usr/bin/echo " + Installing $dep..."
        /usr/bin/apt-get install -y "$dep" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            /usr/bin/echo " - Failed to install $dep. Please check manually."
            exit 1
        fi
    fi
done

# Add necessary permissions for postinst script
/usr/bin/echo " + Adding Permissions..."
/usr/bin/chmod 755 package/DEBIAN/postinst

# Compile the package
/usr/bin/echo " + Building Package..."
dpkg-deb --build package > /dev/null 2>&1

# Install the package
/usr/bin/echo " + Installing Package..."
sudo dpkg -i package.deb > /dev/null 2>&1
if [ $? -ne 0 ]; then
    /usr/bin/echo " - Failed to install the package. Please check the package and dependencies."
    exit 1
fi

# Remove the .deb file after installation
/usr/bin/rm -rf package.deb

# Final message
/usr/bin/echo -e "\n * Installation Complete! 🎉\n"
