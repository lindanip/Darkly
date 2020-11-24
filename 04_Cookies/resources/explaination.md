# Cookies

flag is stored as cookie 

## Where

On home page or any other page [http://10.203.69.31/index.php](http://10.203.69.31/index.php "Home_page")

if we look at our browser storage, on the cookies section we can see that our cookie name is stored as i_am_admin which doesnt make sense, if we look at the cookies password, it looks like MD5 so if we decrypt it using any website capable, it decrypts to false, so we change it to true, then replace the hash of the true password in our browser storage refresh the page, we then get the flag
