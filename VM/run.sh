#!/bin/bash

qemu-system-x86_64 \
  -enable-kvm \
  -m 4098 \
  -smp 2 \
  -drive file=$HOME/vms/minikube/debian-13-generic-amd64.qcow2,if=virtio \
  -drive file=$HOME/vms/minikube/seed.img,if=virtio,format=raw \
  -netdev user,id=net0,\
hostfwd=tcp::9383-:22,\
hostfwd=tcp::3000-:3000,\
hostfwd=tcp::3001-:3001,\
hostfwd=tcp::5000-:5000,\
hostfwd=tcp::9090-:9090,\
hostfwd=tcp::7070-:8080 \
  -device virtio-net-pci,netdev=net0 \
  -nographic
