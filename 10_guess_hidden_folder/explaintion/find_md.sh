#! /bin/bash

read -p "Enter ip address : " IP
mkdir ./scrape; cd ./scrape
wget --mirror -A README -e robots=off $IP/.hidden/
find -name README | xargs grep [0-9]
