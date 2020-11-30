# Redirect

[http://10.203.72.119/](http://10.203.72.119/ 'index') on the home page ***footer***

The Facebook, Twitter and Instagram link are vunerable, the is the facebook link.

```html
<li><a href="index.php?page=redirect site=facebook" class="icon fa-facebook"></a></li>
```
## Manipulation
With the ***redirect*** exposed like this on the front-end, we can the inspect the page and change it what we want. After the change and the link is clicked, we then get the flag

## Risk
This type of vunrebility can be used by hackers to social engineer, by fooling people, thinking that the redirect is authentic to this site
```html
<li><a href="index.php?page=redirect site=nsa.gov" class="icon fa-facebook"></a></li>
```

## Solution
Redirect url should be stored at the back-end and not exposed like this to the users of the web application.