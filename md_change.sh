!#/bin/bash
START=$1
FINISH=$2

for i in {0..7}; do umount /dev/md$i; done
rmdir /var/....
for i in {$START..$FINISH}; do mkdir /var/....$i; done
