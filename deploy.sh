#!/bin/sh
# $1: service name [AppInfoService, SleepService, IdentityService, MetricService, CMSWebApp, SleepAidenWeb]

if [ "$#" -ne 1 ]; then
  echo "Usage: ./deploy.sh  <service name>"
  exit 1
fi

# change work directory
cd /www/$1

# reset git status
git reset --hard

# pull the latest code
git pull

# update dependencies
npm update

# restart service
pm2 restart ecosystem.config.js

# open the log console

pm2 log $1
