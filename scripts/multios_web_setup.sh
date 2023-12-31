#!/bin/bash


#Variable Declaration
URL='https://www.tooplate.com/zip-templates/2093_flight.zip'
ART_NAME='2093_flight'
TEMPDIR="/tmp/webfiles"

yum --help > /dev/null

if [ $? -eq 0 ]

then

#Set Variables For Cent OS
PACKAGE="httpd wget unzip"
SVC="httpd"

echo "Running Variables For Cent OS"
# Installing Dependencies
echo
echo "####################"
echo "Installing Packages"
echo  "###################"
echo
sudo yum install $PACKAGE -y >> /dev/null

#Start and Enable services
echo
echo "################################"
echo "Starting & Enable HTTPD Services"
echo "################################"
echo 
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo
# Creating Temp Directory
echo
echo "####################"
echo "Creating TEMP Folder"
echo "####################"
echo 
mkdir -p $TEMPDIR
cd $TEMPDIR
echo
echo "###########"
echo "Install ART"
echo "###########"
echo
wget $URL >> /dev/null
unzip $ART_NAME.zip >> /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

#Restarting HTTPD
echo
echo "########################"
echo "Restarting HTTPD Service"
echo "########################"
echo
systemctl restart $SVC
echo

#Clean Up
echo
echo "########################"
echo "Removing Temporary Files"
echo "########################"
echo 
rm -rf $TEMPDIR
echo
echo "#####################"
echo "Checking HTTPD Status"
echo "#####################"
echo
sudo systemctl status $SVC | grep Active
ls /var/www/html/
echo

else

#Set Variables For Ubuntu OS
PACKAGE="apache2 wget unzip"
SVC="apache2"

echo "Running Variables For Ubuntu OS"
# Installing Dependencies
echo
echo "####################"
echo "Updating Directories"
echo "####################"
echo
sudo apt update
echo
echo "####################"
echo "Installing Packages"
echo  "###################"
echo
sudo apt install $PACKAGE -y >> /dev/null

#Start and Enable services
echo
echo "##################################"
echo "Starting & Enable Apache2 Services"
echo "##################################"
echo 
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo
# Creating Temp Directory
echo
echo "####################"
echo "Creating TEMP Folder"
echo "####################"
echo 
mkdir -p $TEMPDIR
cd $TEMPDIR
echo
echo "###########"
echo "Install ART"
echo "###########"
echo
wget $URL >> /dev/null
unzip $ART_NAME.zip >> /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

#Restarting Apache2
echo
echo "##########################"
echo "Restarting Apache2 Service"
echo "##########################"
echo
sudo systemctl restart $SVC
echo

#Clean Up
echo
echo "########################"
echo "Removing Temporary Files"
echo "########################"
echo 
rm -rf $TEMPDIR
echo
echo "#######################"
echo "Checking Apache2 Status"
echo "#######################"
echo
sudo systemctl status $SVC | grep Active
ls /var/www/html/
echo

fi
