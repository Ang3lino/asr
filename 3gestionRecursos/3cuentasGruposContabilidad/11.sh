#!/bin/sh

# Crea un script que realice la creación de cuentas de usuario y genere un fichero con un listado de las mismas. El script tiene tres parámetros:

# - El nombre raíz de las cuentas
# - El nombre del directorio raíz donde se deben crear los directorios de trabajo de las cuentas.
# - El número de cuentas a generar.

dir_path=$1
grp_name=$1
n_accounts=$1

# create the directory and the group
mkdir $grp_name
chown -R 771 $grp_name
groupadd $grp_name

# create the accounts and link them with its folder, create a random password for each one and store them in a file
for i in {1..n_accounts}; do
    passwd=$(echo "$date$i" | md5sum | cut -c -12)
    usri="$grp_name$i"
    useradd $usri -p $passwd
    adduser $usri $grp_name

    printf "$usri\t$passwd\n" >> credentials.txt
done

exit 0

