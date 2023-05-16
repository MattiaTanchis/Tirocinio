FROM postgres

LABEL author="mattia"

COPY *.sql /docker-entrypoint-initdb.d/
