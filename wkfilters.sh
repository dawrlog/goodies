#!/bin/bash
pacman -S nftables sshguard --noconfirm
curl -O https://raw.githubusercontent.com/dawrlog/goodies/main/nftables.conf
nft -f ./nftables.conf
sed -i 's/sshg-fw-iptables/sshg-fw-nft-sets/g' /etc/sshguard.conf

systemctl enable nftables 
systemctl enable sshguard

rm -f ./nftables.conf