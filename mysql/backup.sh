#!/bin/bash

# Solicitar al usuario que ingrese la contraseña
echo -n "Ingrese la contraseña: "
read  password

docker exec -i mysql /usr/bin/mysqldump -u root --password=$password dbconvocatoria > backup.sql
