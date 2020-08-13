#!/usr/bin/env bash

set -eoux pipefail

apt-get update
apt-get install -y apache2

#Install SSM-Agent
sudo snap install amazon-ssm-agent --classic
sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
sudo systemctl enable amazon-ssm-agent.service
#sudo apt-get install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
#sudo systemctl start amazon-ssm-agent
#sudo systemctl enable amazon-ssm-agent.service
