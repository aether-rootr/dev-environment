#!/bin/bash
set -e

apt-get -y update

# install sshd
apt-get install -y openssh-server
mkdir -p /var/run/sshd

# setting sshd
echo "root:123456" | chpasswd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "UsePAM yes" >> /etc/ssh/sshd_config
echo "Port 23" >> /etc/ssh/sshd_config

# install basic tool
apt-get install -y vim
apt-get install -y wget
apt-get install -y htop
apt-get install -y net-tools

# install git and github cli
apt-get install -y git
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt-get update
apt-get install gh

# install pip3
apt-get install -y python3-pip

# install C++
apt-get install -y build-essential

# install bazel
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
apt-get install -y curl
curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
apt-get -y update
apt-get -y install bazel
apt-get install -y --only-upgrade bazel