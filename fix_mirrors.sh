#!/bin/bash
[ "$EUID" -ne 0 ] && echo "Please run as root" && exit 1

dnf install -y dnf-plugins-core

for conf in /etc/dnf/dnf.conf /etc/yum.repos.d/fastestmirror.conf; do
   echo "fastestmirror=1" >> $conf
   echo "max_parallel_downloads=10" >> $conf
done

dnf clean all && dnf makecache
echo "DNF configured for faster mirrors"
