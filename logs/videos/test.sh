!/bin/sh

/home/ubuntu/DHP/imageurls

for dir in */*/; do
    cp -r test.log  $dir;
done

