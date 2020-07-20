#!/bin/sh

cd /home/ubuntu/DHP/imageurls

for dir in */*/*/; do
    cp file -r $dir/;
done

