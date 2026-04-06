---
tags:
  - lab
  - staging
  - linux
  - vm
  - proxmox
  - template
Creation date: Monday April 4th 2022 11:18:30
---
The following is a quick-guide to generating a clean instance-template for use for your [[Network/Services/Proxmox/index]] virtual machines.
### Download an 'img'
First, select an appropriate image from [the list](https://cloud-images.ubuntu.com/daily/server/releases/noble/release/). Then, download the selected cloud-init image (I chose the latest release of Noble Numbat).
```bash
# Download the cloud image to the local storeage
wget -P /var/lib/vz/template/iso/ https://cloud-images.ubuntu.com/minimal/releases/noble/release/ubuntu-24.04-minimal-️cloudimg-amd64.img
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
qm set 9000 --nameserver 10.10.0.4
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
Then I created a VM using the new template like so:
```bash
qm clone 9000 201 --name "new-ubuntu-vm"
```
️️To utilize the CEPHFS drives instead of `local-lvm` (by replacing it with `ceph-pool`), a straightforward approach would be to modify where the image is imported from, as well as update the commands that reference it.

A preliminary test has indeed confirmed that this setup functions seamlessly on CEPH volumes. The next logical step involves integrating this configuration into my Ansible playbooks for enhanced automation and streamlined server management.

This integration will not only simplify the process of managing multiple servers but also ensure consistency across all environments, thereby reducing potential errors caused by manual configurations. By leveraging [[Knowledge Base/Ansible/index]]'s capabilities to automate repetitive tasks, I can focus on more complex aspects of server administration while maintaining a high level of efficiency and reliability.

To achieve this, I need to update my playbooks with the necessary modifications, including changing the import locations for images and updating commands that reference them. This will involve a combination of Ansible's `import_image` module and possibly some custom scripting to handle specific requirements.

Once these updates are in place, I can run my playbooks to deploy and manage servers using CEPHFS drives, ensuring that all configurations are consistent and up-to-date across the board. This not only enhances server management but also provides a scalable solution for future growth and expansion.️
