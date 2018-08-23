#!/bin/bash
# Script for installing the required software to the master machine
# Set Up Awscli then run the playbook

# Install Python
apt-get update                 # Run Update
apt-get -y install python     # Install Python

# Install Ansible
apt-add-repository -y ppa:ansible/ansible
apt-get -y update
apt-get -y install software-properties-common
apt-get -y install ansible

# Install AWSCLI
sudo apt install -y awscli                      # Install AWSCLI
sudo aws configure                                # Open AWS configure file for adding the AWS key

sudo ansible-playbook -i ./hosts wordpress.yml    # Run the PlayBook
