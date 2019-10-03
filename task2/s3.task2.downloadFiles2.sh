#!/bin/bash
bucket="ak.staticwebsitetask2"
date="2019-09-29T17:36:17.000Z"
fileList=`aws s3api list-objects --bucket $bucket --output text --query "Contents[].Key"`
for val in $fileList
do
  versionId=`aws s3api list-object-versions --bucket ak.staticwebsitetask2 --prefix $val --output text --query "Versions[?LastModified<='$date']|[0].VersionId"`
  if [ $versionId != None ]
  then
    aws s3api get-object --bucket $bucket --key $val ./$val --version-id $versionId
  fi
done
