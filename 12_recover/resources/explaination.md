# Recovery_Page

email store explictly in front-end textbox

## Where

On the recovery page [http://10.203.69.31/?page=recover](http://192.168.1.59/?page=recover "recovery page")

the page has a submit button but doesnt have a textbox, if we click the submit button we get wrong answer image.
So then if we inspect the page we find the form and it looks like this
```html
<form action="#" method="POST">
	<input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">
	<input type="submit" name="Submit" value="Submit">
</form>
```
the value of the email is stored on the front-end, in a hidden textbox, if we change this email and submit we then get the flag

## Manipulation

So we the email stored in the front-end like this we can the change the email to our own email, we can the get the contents of the email, which could be anything. A hacker can take advantage of the content found.

## Solution

We should not store the recovery email on the front end like this. it should be store at the backend.





