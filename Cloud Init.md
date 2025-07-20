---
tags:
  - lab
  - staging
  - linux
  - vm
  - proxmox
Creation date: Monday April 4th 2022 11:18:30
---
-----

### Download an 'img'
First, select an image from [the list](https://cloud-images.ubuntu.com/daily/server/releases/
Then, download the selected cloud-init image (I chose the latest release of the minimal/noble-numbat)
```bash
# Download the cloud image to the local storeage
wget -P /var/lib/vz/template/iso/ https://cloud-images.ubuntu.com/minimal/releases/noble/release/ubuntu-24.04-minimal-cloudimg-amd64.img
```
### Create the Template
Create the Cloud-init VM template with the following commands in a terminal shell on the ProxMox server:
```bash
# Generate the VM config base
qm create 9000 --name "ubuntu-cloud-init-template" --memory 8192 --balloon 2048 --cores 2 --net0 virtio,bridge=vmbr0
# Copy the image file to the VM
qm importdisk 9000 /var/lib/vz/template/iso/ubuntu-24.04-minimal-cloudimg-amd64.img local-lvm
# Mount Image as the boot drive
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-0
# The initial disk is only 2GB, thus we make it larger
qm resize 9000 scsi0 +30G
# Set it to boot
qm set 9000 --boot c --bootdisk scsi0
qm set 9000 --ide2 local-lvm:cloudinit
# Setup the network
qm set 9000 --ipconfig0 ip=dhcp
qm set 9000 --searchdomain yeticraft.net
# Create the user
qm set 9000 --ciuser nexus --cipassword 'nexus'
qm set 9000 --sshkeys ~/.ssh/vm_keys
# For many Cloud-Init images, it is required to configure a serial console 
qm set 9000 --serial0 socket --vga serial0

# Convert the VM to a template
# Warning! No further changes to the template can happen at this point
qm template 9000
```
### Create a VM
Then create a VM using the template like so:
```bash
qm clone 9000 201 --name "new-ubuntu-vm"
```
To use the CEPHFS drives instead, I am guessing that I would simply need to change where I import the image to, and also the following commands that reference it.