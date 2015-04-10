#!/bin/bash
# 
# Firstboot script
#
# Sets hostname, motd & puppet repo/install
#
IP=`ip a | grep "scope global eth1" | awk '{print $2}' | awk -F/ '{print $1}'`

#read HOSTNAME?"Enter hostname: "

HOSTNAME=puppet-client.den.com
echo $HOSTNAME "will be used. finishing the build..."
sed -i "s/HOSTNAME=.*/HOSTNAME=$HOSTNAME/g" /etc/sysconfig/network
hostname "$HOSTNAME"

cat >> /etc/hosts <<EOF
192.168.0.18 puppet puppet-master.den.com
$IP	$HOSTNAME $HOSTNAME.den.com
EOF

cat >> /etc/resolv.conf <<EOF
search den.com
nameserver 192.168.0.1
EOF
chattr +i /etc/resolv.conf

cat > /etc/motd <<EOF
Welcome to $hostname
This Server has been setup using kickstart + firstboot.

EOF
#yum-config-manager --disable base,extras,updates
cat > /etc/yum.repos.d/Puppet-Repo.repo <<EOF
[puppetrepo]
name=Puppet Repo
baseurl=http://192.168.0.17/puppet
gpgcheck=0
enabled=1
EOF

yum clean all
yum -y install puppet
sleep 2
puppet agent -t
sleep 5
puppet config set environment development --section agent
puppet config set server puppet-master.den.com --section agent
puppet agent -t
sleep 2
reboot
