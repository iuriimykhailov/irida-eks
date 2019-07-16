#!/bin/bash
aws ec2 describe-volumes --query "Volumes[*].VolumeId" | grep vol- | tr -d \", | while read line
do 
aws ec2 modify-volume --size 50 --volume-id $line
done
