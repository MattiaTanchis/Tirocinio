#!/bin/bash


set -e
#creazione dell-utente mattia_root con set della psw e succesivo assegnamento dei permessi. Creazione DB test script
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    
    CREATE USER mattia_root WITH PASSWORD 'admin';
    CREATE DATABASE test_script;
    GRANT ALL PRIVILEGES ON DATABASE test_script TO mattia_root;
EOSQL
#creazione della tabella persona script nel DB test script 
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "test_script" <<-EOSQL
    CREATE TABLE persona_script
    (id_pers integer PRIMARY KEY,
     name TEXT,
     city TEXT
    );
EOSQL
# importo file sql per creazione tabelle specificate nel file presente nel bind mount
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "test_script" -f "/var/lib/data_init/db/init_data.sql"

#popolamento della tabella test_script tramite file csv presente nel bind mount
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "test_script" <<-EOSQL
 COPY persona_script  
 FROM '/var/lib/data_init/db/init_data.csv'
 DELIMITER ',' 
 CSV HEADER;
EOSQL  #comando COPY per buttare dentro i dati, FROM indica dove vado a prendere il file CSV nel bind mount, Delimiter indica con che cosa vengono separati i dati 
       #CSV HEADER specifica con cosa inizia il file CSV 


 


