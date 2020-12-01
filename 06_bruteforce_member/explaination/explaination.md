# Brute force

We will bruteforce entry on the login page [http://10.203.72.119/index.php?page=signin](http://10.203.72.119/index.php?page=signin "signin page")

## Solution
To prevent this action a user must have a difficult password, atleast a uppercase, special characters, the password must be lengthy, conatain a number, and must not be common dictionary words. The more complicated the password is the better. The web application must limit the login attempt, considerably 3 passwords at a time, and maybe resume the login after 30sec if the user fails to enter the right credentails. Use OTPs, use Captcha, or two Factor authentification.