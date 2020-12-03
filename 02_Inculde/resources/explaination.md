# Include

## Method 
We have discoverd that the server uses the linux system we can then try to find the etc/passwd by performing a ***directory traversal exploit***

[http://10.203.69.31/?page=../../../../../../../etc/passwd](http://10.203.69.31/?page=../../../../../../../etc/passwd "etc/passwd")

if we navigate to this page we then get the flag

## Issues
By performing this exploit a hacker can the read files that are restricted to users, the hacker can then read these files to get more information on how to futher exploit the site.


## Solution
1. The program must validate the user input before processing it, ***regular expression*** can be used to check for any unusual input from what is expected.