#!/bin/sh
# $1: is the zip file that contains ssl certificate
# $2: the domain, e.g. sleepaiden.com or api.sleepaiden.com

if [ "$#" -ne 2 ]; then
  echo "Usage: ./install_ssl.sh  <ssl zip file> <domain>"
  exit 1
fi

# delete temporary files if exist
rm -rf ca_bundle.crt certificate.crt private.key $2.crt

# unzip ssl files
unzip $1

# generate chained certificate
(cat certificate.crt; echo ""; cat ca_bundle.crt;) > $2.crt

# create certificate dir if not exists
sudo mkdir -p /etc/nginx/ssl

# move files
sudo mv private.key /etc/nginx/ssl/$2.key
sudo mv $2.crt /etc/nginx/ssl/$2.crt

# clean

rm -rf ca_bundle.crt certificate.crt
