#!/bin/bash
sudo yum update -y
sudo yum install java-11-amazon-corretto -y
wget https://services.gradle.org/distributions/gradle-6.5.1-bin.zip -P /tmp
sudo unzip -d /opt/gradle /tmp/gradle-*.zip
cd /etc/profile.d/
sudo su
sudo echo "export PATH=$PATH:/opt/gradle/gradle-6.5.1/bin" > script.sh