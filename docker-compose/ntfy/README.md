# NTFY notifications

<<https://github.com/binwiederhier/ntfy>
<<https://ntfy.sh/docs>

uses and such

fun use: get notification when someone logs in via ssh

step 1

edit the file /etc/pam.d/sshd

```bash
sudo nano /etc/pam.d/sshd
```

add the following at the end of the file

```bash
session optional pam_exec.so /usr/bin/ntfy-ssh-login.sh
```

step 2: create a script

```bash
sudo nano /usr/bin/ntfy-ssh-login.sh
```

```bash
#!/bin/bash
if [ "${PAM_TYPE}" = "open_session" ]; then
  curl \
    -H prio:high \
    -H tags:warning \
    -d "SSH login on ${HOSTNAME} by ${PAM_USER} from ${PAM_RHOST}" \
   https://ntfy.srlrd.xyz/alerts
fi

#sends a notification via ntfy upon any ssh login
```

make that file executable

```bash
sudo chmod +x /usr/bin/ntfy-ssh-login.sh
```

and you are done!
