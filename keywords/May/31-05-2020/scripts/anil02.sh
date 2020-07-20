#!/bin/bash
dat=$1
key=/root/.ssh/mst.pem
curl -o ./ips/kimages  http://18.207.24.43/kimages
for i in `cat ./keywords/May/31-05-2020/urls/02`;do ip=`shuf -n 1 ./ips/kimages`; echo $ip; ssh -o StrictHostKeyChecking=no -i $key root@$ip ./alpha8.sh "\"$i\"" "\"$dat\"";done
echo Subject: Job anil02.sh completed | sendmail sheetal.pant@leotechnosoft.net
#screen -X quit
