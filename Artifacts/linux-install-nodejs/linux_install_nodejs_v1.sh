#!/bin/bash

echo "Installing NodeJs"

isApt=`command -v apt-get`
isYum=`command -v yum`

set -e

if [ -n "$isApt" ] ; then
    echo "Using APT package manager"

    apt-get -y update
    
    curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
    apt-get -y install nodejs
    exit 0

elif [ -n "$isYum" ] ; then
    echo "Using YUM package manager"

    yum -y update
    yum clean all
    
    yum install -y epel-release
    yum install -y nodejs npm
    exit 0
fi

exit 1
