# Cookies

flag is stored as cookie 

## Where

On home page or any other page [http://10.203.69.31/index.php](http://10.203.69.31/index.php "Home_page")

if we look at our browser storage, on the cookies section we can see that our cookie name is stored as i_am_admin which doesnt make sense, if we look at the cookies password, it looks like MD5 so if we decrypt it using any website capable, it decrypts to false, so we change it to true, then replace the hash of the true password in our browser storage refresh the page, we then get the flag.

## Purpose
With this flag hidden in the cookie, is part of enumeration of the web application, to get as much possible information we can get about the application. This helps with having levarage against the application. The more information the hacker has about a web application the easier it gets for them hide their trails or futher find exploit entries.
