# Fix Windows 10 Sleep Issue

## Problem Definition

- Windows 10 
- Only turn off screen when it sleeps
- Can use the touch pad to wake up immediatly, no login screen

## Solution

Edit Regestry:

Change `\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power\AwayModeEnabled` to `0`