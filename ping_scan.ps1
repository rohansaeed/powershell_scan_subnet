 1..255 | % {ping -n 1 -w 100 192.168.1.$_} | Select-String ttl | % {$_ -Replace '^Reply from |: bytes=.+'} | % {echo "$_, up"} > online_hosts.csv
