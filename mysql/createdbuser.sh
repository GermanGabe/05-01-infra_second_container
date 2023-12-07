#!/bin/bash

DATABASE_DEV="dbconvocatoriadev"
DATABASE_PROD="dbconvocatoriaprod"

PASSWORD_ROOT="adminrootmysql"

USER_DEV="adminconvocatoriadev"
USER_PROD="adminconvocatoriaprod"

PASSWORD_DEV="claveadminconvocatoriadev"
PASSWORD_PROD="claveadminconvocatoriaprod"



# Crear base de datos
create_database() {
    local database_name="$1"
    docker exec -i mysql /usr/bin/mysql -u root --password=$PASSWORD_ROOT -e "CREATE DATABASE $database_name;"
}

# Crear usuario
create_user() {
    local user="$1"
    local password="$2"
    echo "-----------------------________"
    echo $password
   docker exec -i mysql /usr/bin/mysql -u root --password=$PASSWORD_ROOT -e "CREATE USER '$user'@'%' IDENTIFIED BY '$password';"
   docker exec -i mysql /usr/bin/mysql -u root --password=$PASSWORD_ROOT -e "CREATE USER '$user'@'localhost' IDENTIFIED BY '$password';"
}

# Asignar privilegios
grant_privileges() {
    local database="$1"
    local user="$2"
    #docker exec -i mysql /usr/bin/mysql -u root --password=$PASSWORD_ROOT -e "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'%' WITH GRANT OPTION;"
 docker exec -i mysql /usr/bin/mysql -u root --password=$PASSWORD_ROOT -e "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'%';"
 docker exec -i mysql /usr/bin/mysql -u root --password=$PASSWORD_ROOT -e "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'localhost';"
 docker exec -i mysql /usr/bin/mysql -u root --password=$PASSWORD_ROOT -e "FLUSH PRIVILEGES;"
}

# Crear bases de datos y usuarios
create_database $DATABASE_DEV
create_database $DATABASE_PROD

create_user $USER_DEV $PASSWORD_DEV
create_user $USER_PROD $PASSWORD_PROD

# Asignar privilegios a las bases de datos y usuarios
grant_privileges $DATABASE_DEV $USER_DEV 
grant_privileges $DATABASE_PROD $USER_PROD 

