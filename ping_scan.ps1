#Scan the subnet 192.168.1.0/24 and return a list of online hosts (as a CSV file); can be used as part of network segregation testing.
#Sample output:
#"192.168.1.1,up,2020-07-12,09:19:20"
1..255 | % {ping -n 1 -w 100 192.168.1.$_} | Select-String ttl | % {$_ -Replace '^Reply from |: bytes=.+'} | % {echo "$_,up,$(Get-Date -Format d),$(Get-Date -Format hh:mm:ss)"} > online_hosts.csv
