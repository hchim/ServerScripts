#!/bin/sh
# $1: is the zip file that contains ssl certificate

# delete temporary files if exist
rm -rf ca_bundle.crt certificate.crt private.key sleepaiden.com.crt

# unzip ssl files
unzip $1

# generate chained certificate
(cat certificate.crt; echo ""; cat ca_bundle.crt;) > sleepaiden.com.crt

# create certificate dir if not exists
sudo mkdir -p /etc/nginx/ssl

# move files
sudo mv private.key /etc/nginx/ssl/sleepaiden.com.key
sudo mv sleepaiden.com.crt /etc/nginx/ssl/sleepaiden.com.crt

# clean

rm -rf ca_bundle.crt certificate.crt
