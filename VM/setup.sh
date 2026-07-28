# Qemu
## Download Image
wget https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2 -O debiab.qcow2
## Create VM instance
qemu-img resize debian.qcow2 20G
cloud-localds seed.img user-data meta-data
