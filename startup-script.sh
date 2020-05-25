#!/bin/bash
if sudo blkid /dev/sdb;then
    exit
else
    sudo mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb; \
    sudo mkdir -p /opt/vault/data
    sudo mount -o discard,defaults /dev/sdb /opt/vault/data
    echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /opt/vault/data ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab
    sudo chown -R vault:vault /opt/vault/data
    sudo chmod -R 777 /opt/vault/data
    sudo chown -R vault:vault /opt/vault/log
    sudo chmod -R 777 /opt/vault/log
    sudo sed -i "s/_HOSTNAME/$HOSTNAME/g" /opt/vault/config/vault-node-config.hcl
fi
