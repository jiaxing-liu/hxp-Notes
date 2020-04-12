# Change your usermane in Windows 10

## Edit Registry

Enter directory:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList
```

One of the subdirectories has a key named `ProfileImagePath` valued like `C:\Users\your_default_user_name`. Change `your_default_user_name` to `your_new_username`, for example.

And then logout.

## Change your name in the user profile directory

Log in. Error may occur and you will be logged in as temporary user.

Look into `C:\Users`, rename `your_default_user_name` folder to `your_new_username`.

Log out again and log back.
