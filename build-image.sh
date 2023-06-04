#!/bin/sh

set -o errexit

F=alpine-virt-image-$(date +%Y-%m-%d-%H%M)

packages=`cat packages`

./alpine-make-vm-image/alpine-make-vm-image \
  --packages "$packages" \
  --repositories-file repositories \
  --script-chroot \
  --image-format qcow2 \
  $F.qcow2 \
  ./setup.sh
bzip2 -z $F.qcow2
