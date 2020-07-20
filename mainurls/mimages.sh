#!/bin/bash
dat=$1
key=/root/.ssh/mst.pem
curl -o ./ips/imageips  http://18.207.24.43/imageips
for i in `cat xaa/gaa`;do ip=`shuf -n 1 ./ips/imageips`; echo $ip; ssh -o StrictHostKeyChecking=no -i $key root@$ip ./alpha3.sh "\"$i\"" "\"$dat\"";done
echo Subject: Job job1 completed | sendmail sheetal.pant@leotechnosoft.net
screen -X quit
