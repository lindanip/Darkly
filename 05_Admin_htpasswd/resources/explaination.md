# Admin_htpasswd

From the robots.txt we find there is two folders /whatever and /.hidden. 

When we navigate to [http://10.203.69.31/whatever/](http://10.203.69.31/whatever/ "whatever") we find a file that will be downloadable file named htpasswd

In the htpasswd folder downloaded we find root:8621ffdbc5698829397d97767ac13db3

and if we decrypt the hash it converts to dragon

if we use this to login to the [http://10.203.69.31/admin/#](http://10.203.69.31/admin/# "admin_page") admin page we get the flag 

## Solution