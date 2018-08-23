#!/bin/bash
# Script for installing the required software to the master machine
# Set Up Awscli then run the playbook

# Install Python
apt update                 # Run Update
apt-get install python     # Install Python

# Install Ansible
apt-get update
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible

# Install AWSCLI
apt install awscli                      # Install AWSCLI
aws configure                                # Open AWS configure file for adding the AWS key

#sudo ansible-playbook -i ./hosts wordpress.yml    # Run the PlayBook

