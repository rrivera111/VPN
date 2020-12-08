#!/bin/bash

hostname=$1
[ -z "$hostname" ] && echo "Empty hostnamename! Use `basename $0` hostname" && exit

rsa_folder="/usr/share/easy-rsa"
cert_file=$rsa_folder"/issued/"$hostname".crt"

#source $rsa_folder/vars
if [ ! -f $cert_file ]; then
    $rsa_folder/easyrsa build-client-full $hostname nopass
    /usr/bin/python3 /usr/local/scripts/create_ccd.py $hostname
else
    echo "The host certificate already exists"
fi
