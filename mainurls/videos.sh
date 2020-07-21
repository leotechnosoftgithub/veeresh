#!/bin/bash
dat=$1
key=/root/.ssh/mst.pem
curl -o ./ips/veeresh  http://18.207.24.43/veeresh
for i in `cat xaa/gaa`;do ip=`shuf -n 1 ./ips/veeresh`; echo $ip; ssh -o StrictHostKeyChecking=no -i $key root@$ip ./veeresh.sh "\"$i\"" "\"$dat\"";done
echo Subject: Job job1 completed | sendmail sheetal.pant@leotechnosoft.net
screen -X quit
