#!/bin/sh

# Crea un script que dado un código de grupo (GID) como argumento, escriba en la salida estándar el nombre de grupo que le corresponde.

# 1:2:3:4:5:6:7
# 1 - Username: It is used when user logs in. It should be between 1 and 32 characters in length.
# 2 - Password: An x character indicates that encrypted password is stored in /etc/shadow file. Please note that you need to use the passwd command to computes the hash of a password typed at the CLI or to store/update the hash of the password in /etc/shadow file.
# 3 - User ID (UID): Each user must be assigned a user ID (UID). UID 0 (zero) is reserved for root and UIDs 1-99 are reserved for other predefined accounts. Further UID 100-999 are reserved by system for administrative and system accounts/groups.
# 4 - Group ID (GID): The primary group ID (stored in /etc/group file)
# 5 - User ID Info: The comment field. It allow you to add extra information about the users such as user’s full name, phone number etc. This field use by finger command.
# 6 - Home directory: The absolute path to the directory the user will be in when they log in. If this directory does not exists then users directory becomes /
# 7 - Command/shell: The absolute path of a command or shell (/bin/bash). Typically, this is a shell. Please note that it does not have to be a shell.


if [ $# -ne 1 ]; then
    echo 'Se debe de proveer el GID.'
    exit 1
fi

gid=$1
usrname=$(grep $gid /etc/passwd | cut -d ':' -f1)
echo $usrname

exit 0

