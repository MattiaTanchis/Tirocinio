CREATE TABLE IF NOT EXISTS quote (
    id SERIAL PRIMARY KEY,
    quote character varying(255) NOT NULL UNIQUE,
    author character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);



CREATE TABLE IF NOT EXISTS Persona(
    id_persona INTEGER NOT NULL,
    nome varchar(200) NOT NULL,
    citta varchar(100),
    PRIMARY KEY(id_persona)
);

CREATE TABLE IF NOT EXISTS Account(
    id_account INTEGER NOT NULL,
    nickname varchar(200) NOT NULL,
    id_persona INTEGER NOT NULL,
    PRIMARY KEY(id_account),
    FOREIGN KEY(id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE IF NOT EXISTS Ordine(
 id_ordine INTEGER NOT NULL,
 numero_ordine INTEGER NOT NULL,
 id_account INTEGER NOT NULL,
 PRIMARY KEY(id_ordine),
 FOREIGN KEY(id_account) REFERENCES Account(id_account)
);


