#!/bin/bash

#Author :Elvis
#Description : Sonarqube installation
#Date :6/20/2022
#

# ====Ensuring user is not root===
if
[  $UID -eq 0 ]
then
echo "User root, log in as regular user"
exit 1
fi


#======Installing java=======
sudo yum update -y

sudo yum install java-11-openjdk-devel -y

sudo yum install java-11-openjdk -y

#======downloading latest sonarqube  from server====

sudo yum install wget -y

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip -P /opt

#=======Extract packages========

sudo yum install unzip -y

sudo unzip /opt/sonarqube-9.3.0.51899.zip -d /opt

sudo chown -R $USER:$USER /opt/sonarqube-9.3.0.51899

sudo sed -i 's/#RUN_AS_USER=/RUN_AS_USER=$USER/g' /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh

sudo chmod +x /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh

sudo /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh start

sudo /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh status

