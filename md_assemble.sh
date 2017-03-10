#need create script
IFS=$'\n'; for I in $( cat list | sed -n 3p);do MD=$( echo $I | awk '{print $NF}' ); DISKS=$( grep -w $MD list | awk '{print "/dev/"$1}'| xargs echo); echo mdadm --assemble /de
v/$MD $DISKS;done
IFS=$'\n'; for I in $( cat list | sed -n 3,1000p);do MD=$( echo $I | awk '{print $NF}' ); DISKS=$( grep -w $MD list | awk '{print "/dev/"$1}'| xargs echo); echo mdadm --assembl
e /dev/$MD $DISKS;done
IFS=$'\n'; for I in $( cat list | sed -n 3,1000p);do MD=$( echo $I | awk '{print $NF}' ); DISKS=$( grep -w $MD list | awk '{print "/dev/"$1}'| xargs echo); echo mdadm --assembl
e /dev/$MD $DISKS;done > 1
cat 1
cat 1 | bash
