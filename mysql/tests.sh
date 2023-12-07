docker exec -i mysql /usr/bin/mysql -u root --password=adminrootmysql -e "show databases"
docker exec -i mysql /usr/bin/mysql -u root --password=adminrootmysql -e "SELECT user,host FROM mysql.user;"
docker exec -i mysql /usr/bin/mysql -u root --password=adminrootmysql -e "SHOW GRANTS FOR 'adminconvocatoriadev'@'%';"
docker exec -i mysql /usr/bin/mysql -u root --password=adminrootmysql -e "SHOW GRANTS FOR 'adminconvocatoriadev'@'localhost';"
docker exec -i mysql /usr/bin/mysql -u root --password=adminrootmysql -e "SHOW GRANTS FOR 'adminconvocatoriaprod'@'%';"

