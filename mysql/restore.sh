#!/bin/bash

cat backup.sql | docker exec -i mysql /usr/bin/mysql -u root --password=adminrootmysql dbconvocatoriadev
cat backup.sql | docker exec -i mysql /usr/bin/mysql -u root --password=adminrootmysql dbconvocatoriaprod
