# Survey_page

front-end text limit 

## Where

On the recovery page [http://10.203.69.31/?page=survey](http://10.203.69.31/?page=survey "Survey_page")

Well this on this page the problem is with the backend. the limit of the select options is the last one the the value of 10, shown below

```html
<select name="valeur" onchange="javascript:this.form.submit();">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
</select>
```

As the we can change the value to something larger than 10, we then get the flag

## Solution

The value limit must also be checked on the back-end, to prevent complications on the backend