#!/bin/sh

# install pm2-logrotate
pm2 install pm2-logrotate

pm2 set pm2-logrotate:compress true

# rotate everyday at 1AM
pm2 set pm2-logrotate:rotateInterval '0 1 * * *'