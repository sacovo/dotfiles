eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/bin/setxkbmap -option "caps:swapescape"
export SSH_AUTH_SOCK
i3
