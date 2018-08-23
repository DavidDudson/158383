# !/usr/bin/env bash
# Script for installing the required software to the master machine
# Set Up Awscli then run the playbook

# Install Python
sudo apt update                 # Run Update
sudo apt-get install python     # Install Python

# Install Ansible
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

# Install AWSCLI
sudo apt install awscli                      # Install AWSCLI
sudo aws configure                                # Open AWS configure file for adding the AWS key

#sudo ansible-playbook -i ./hosts wordpress.yml    # Run the PlayBook

