FROM postgres

LABEL author="mattia"

#COPY init.sql /docker-entrypoint-initdb.d/
COPY /db/init_db.sh /docker-entrypoint-initdb.d/


