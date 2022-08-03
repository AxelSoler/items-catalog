CREATE DATABASE Items_catalog;

DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS music_album;
DROP TABLE IF EXISTS Label;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Item;

CREATE TABLE Label (
    id INT GENERATED ALWAYS AS IDENTITY,
    title TEXT NOT NULL,
    color TEXT NOT NULL,
    items INT ,
    PRIMARY KEY (id)
);

CREATE TABLE Author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    items INT ,
    PRIMARY KEY (id)
);

CREATE TABLE genre(
	id SERIAL PRIMARY KEY,
	name varchar(100) NULL,
    items INT ,
    PRIMARY KEY (id)
);

CREATE TABLE Item (
    id INT GENERATED ALWAYS AS IDENTITY,
    label INT,
    genre_id int NOT NULL,
    author INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (label) REFERENCES Label (id),
    FOREIGN KEY (author) REFERENCES Author (id),
    FOREIGN KEY(genre_id) REFERENCES genre (id)
);

CREATE TABLE Book ( 
    id INT GENERATED ALWAYS AS IDENTITY, 
    item_id INT NOT NULL, 
    publisher TEXT NOT NULL, 
    cover_state TEXT NOT NULL, 
    FOREIGN KEY (item_id) REFERENCES Item (id), 
    PRIMARY KEY (id) 
);

CREATE TABLE Game ( 
    id INT GENERATED ALWAYS AS IDENTITY, 
    item_id INT NOT NULL, 
    multiplayer BOOLEAN NOT NULL, 
    last_played_at DATE NOT NULL, 
    FOREIGN KEY (item_id) REFERENCES Item (id), 
    PRIMARY KEY (id) 
);

CREATE TABLE music_album(
	id SERIAL PRIMARY KEY,
	on_spotify boolean NOT NULL,
    item_id INT NOT NULL, 
    FOREIGN KEY (item_id) REFERENCES Item (id), 
    PRIMARY KEY (id) 
);
