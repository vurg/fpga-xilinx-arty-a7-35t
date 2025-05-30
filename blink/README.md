# Blink the 4 On-Board LEDs on FPGA Board

```bash
openFPGALoader -b arty blink.bit # Load to volatile memory (RAM)
openFPGALoader -b arty blink.bit # Write to SPI flash memory
```

[![Watch on YouTube](https://img.youtube.com/vi/jF-AkoCAuxQ/hqdefault.jpg)](https://youtube.com/shorts/jF-AkoCAuxQ)


Add drivers to recognize FPGA board:
```bash
# Navigate to the directory containing the USB/JTAG driver installation script for Vivado 2024.2
cd /tools/Xilinx/Vivado/2024.2/data/xicom/cable_drivers/lin64/install_script/install_drivers

# Run the driver installation script with root privileges (installs cable drivers like Digilent and FTDI)
sudo ./install_drivers

# Reload udev rules to ensure the system applies new device rules (for USB/JTAG detection)
sudo udevadm control --reload-rules

# Trigger udev to recognize newly installed drivers without rebooting
sudo udevadm trigger

# Check the kernel message buffer for USB-related logs (to verify cable detection or driver issues)
sudo dmesg | grep -i usb
```

Add Vivado and Vitis to shell environment:
```bash
# Add the Vivado 2024.2 environment setup script to your shell startup file (~/.bashrc)
# This ensures Vivado commands (like `vivado`, `xsdk`, etc.) are available in future terminal sessions
echo 'source /tools/Xilinx/Vivado/2024.2/settings64.sh' >> ~/.bashrc

# Add the Vitis 2024.2 environment setup script to your shell startup file (~/.bashrc)
# This sets up paths and variables for using Vitis (Xilinx's software development platform for FPGAs/SoCs)
echo 'source /tools/Xilinx/Vitis/2024.2/settings64.sh' >> ~/.bashrc
```
