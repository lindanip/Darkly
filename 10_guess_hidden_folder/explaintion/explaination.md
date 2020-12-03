# Hidden folder
Form the [http://10.203.73.150/robots.txt](http://10.203.73.150/robots.txt "robots.txt")

We find that the if directory name ***/.hidden***, and it has a ton of subdirectory, within these sub directories there is a ***README*** file on each.

## Method
We can use ***regular expression*** and ***find***, and ***grep*** command on the terminal to try to find a flag here.
below is a bash script to download these files to directory named ***scrape***

``` bash
#! /bin/bash

read -p "Enter ip address : " IP
mkdir ./scrape; cd ./scrape
wget --mirror -A README -e robots=off $IP/.hidden/
find -name README | xargs grep [0-9]
```
output
``` bash
Downloaded: 5345 files, 4.5M in 0.4s (10.7 MB/s)
./192.168.8.122/.hidden/whtccjokayshttvxycsvykxcfm/igeemtxnvexvxezqwntmzjltkt/lmpanswobhwcozdqixbowvbrhw/README:99dde1d35d1fdd283924d84e6d9f1d820
```
the flag is ***99dde1d35d1fdd283924d84e6d9f1d820***

## Issue
If this was sensetive information, then the hacker would now have more information to use against the application, to peform futher exploit.

## Soultion
Sensitve information should not be stored in these files.