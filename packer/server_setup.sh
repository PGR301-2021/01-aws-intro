#!/usr/bin/env bash
# Wait for cloud-init to finish

sudo apt update -y
sudo apt install -y xrdp
sudo apt install -y whois

sudo systemctl enable xrdp
sudo systemctl status xrdp

sudo adduser student --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "student:s3creeT!" | sudo chpasswd
