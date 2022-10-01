#!/bin/sh

chosen=$(ls .local/share/password-store -I 'otp_*' | cut -d. -f1 | rofi -dmenu -i)
pass -c $chosen
