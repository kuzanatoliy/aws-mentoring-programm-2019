#!/bin/bash
bucket="ak.staticwebsitetask2"
region=`aws s3api get-bucket-location --bucket $bucket --output text`
fileList=`aws s3api list-objects --bucket $bucket --output text --query "Contents[].Key"`
for val in $fileList
do
  echo "$val;https://s3.$region.amazonaws.com/$bucket/$val;" >> temp.csv
done
