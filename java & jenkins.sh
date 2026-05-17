#!/bin/bash

# Update packages
sudo apt update -y

# Install Java 17 from Ubuntu repository
sudo apt install openjdk-17-jdk -y

# Verify Java
java --version

# Create keyrings directory
sudo mkdir -p /usr/share/keyrings

# Add Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt update -y

# Install Jenkins
sudo apt install jenkins -y

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
# Check Jenkins status
sudo systemctl status jenkins
