#!/bin/bash
JUN_NUM=$( lldpctl |grep SysName|head -n 1|awk {'print $2'}|sed 's/jun//' )
GOOD_OCTET=$(($JUN_NUM * 2 % 256))
IP_ON_HOST=$( ip addr|grep 3001|grep inet|awk {'print $2'}|sed 's/\/23//' )
IP_OCTET=$( echo $IP_ON_HOST|cut -d . -f 3 )
DNS_IP=$( host `hostname|sed -E 's/(i|q)/e/'`|awk {'print $4'} )

if [[ "$DNS_IP" != "$IP_ON_HOST" ]]; then
        echo "DNS PTR record not equal ip on host "
        exit 1;
elif [[ $GOOD_OCTET -eq $IP_OCTET  ]]; then
        echo "Bad third ip octet, not equal jun number"
        exit 1;
else
        exit 0;
fi
