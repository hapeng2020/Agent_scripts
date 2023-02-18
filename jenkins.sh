#!/bin/bash

#Author: Happy
#Date: February

#This script is only test on CentOs Stream 9

#Install Java
sudo yum install java-11-openjdk-devel -y
echo

#Enable the Jenkins repository
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repoechosudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.keyecho

#Install the latest stable version of Jenkins
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins
echo
echo

#Adjust the firewall
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
echo
echo

#Show endpoint
yum list | grep -i jenkins
echo
echo "Jenkins installed"
echo
echo "You should now be able to access jenkins at: http://$(curl -s ifconfig.co):8080"
echo
echo "You can copy and paste this password : "$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)" to this website : http://$(curl -s ifconfig.co)':8080"echoecho
Zachary Johnson
To
Everyone
05:48 PM
ZJ
