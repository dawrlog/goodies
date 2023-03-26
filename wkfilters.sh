#!/bin/bash
pacman -S -y nftables sshguard
nft -f ./nftables.conf
sed -i 's/sshg-fw-iptables/sshg-fw-nft-sets/g' /etc/sshguard.conf

systemctl enable nftables 
systemctl enable sshguard