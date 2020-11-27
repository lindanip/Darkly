# XSS Basic
In this exercise we found xxs in the leave feed back page

## Manipulation

We can test by using an html h1 tag to wrap our comment and it prints the comment in a h1 tag.

## Solution 
text at the backend must be treated as strings, and since the site uses php, prepared statements must be used to prevent this