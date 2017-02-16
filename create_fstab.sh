for i in `df|grep sd|awk {'print $1'}`; do UUID=$( blkid $i| awk {'print $2'}|sed 's/\"//g'); echo -e "$i\t$UUID\text4\text4\tdefaults,noatime\t0\t0";done

