#!/bin/bash

#This scripts copies and deploys multiple OS web servers to remote hosts.

#Declaring Variables

user="paul"

for host in `cat remhost` 

do

echo "###########################"
echo " Connecting to remote hosts"
echo "###########################"
echo
echo "###############################"
echo "Pushing scripts to remote hosts"
echo "###############################"
scp /home/ubuntu/Scripts/multios_web_setup.sh $user@$host:/tmp/
echo
echo "#################################"
echo "Executing scripts on remote hosts"
echo "#################################"
ssh $user@$host sudo /tmp/multios_web_setup.sh
echo
echo "###########################"
echo "Cleaning Up Temporary Files"
echo "###########################"
echo 
ssh $user@$host sudo rm -rf /tmp/multios_web_setup.sh


done
