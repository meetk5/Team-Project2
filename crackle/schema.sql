-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UO4bBE
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "moviesandshows" (
    "imdb_id" VARCHAR(50)   NOT NULL,
    "title" VARCHAR(500)   NOT NULL,
    "year" VARCHAR(15)   NOT NULL,
    "rated" VARCHAR(20)   NOT NULL,
    "released" VARCHAR(20)   NOT NULL,
    "runtime" VARCHAR(20)   NOT NULL,
    "genre" VARCHAR(100)   NOT NULL,
    "director" VARCHAR(2000)   NOT NULL,
    "writer" VARCHAR(2000)   NOT NULL,
    "actors" VARCHAR(1000)   NOT NULL,
    "language" VARCHAR(1000)   NOT NULL,
    "country" VARCHAR(500)   NOT NULL,
    "imdb_rating" VARCHAR(100)   NOT NULL,
    "type" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_moviesandshows" PRIMARY KEY (
        "imdb_id"
     )
);

CREATE TABLE "moviesource" (
    "imdb_id" VARCHAR(50)   NOT NULL,
    "source_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_moviesource" PRIMARY KEY (
        "imdb_id","source_id"
     )
);

CREATE TABLE "source" (
    "source_id" VARCHAR(10)   NOT NULL,
    "source" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_source" PRIMARY KEY (
        "source_id"
     )
);

ALTER TABLE "moviesource" ADD CONSTRAINT "fk_moviesource_imdb_id" FOREIGN KEY("imdb_id")
REFERENCES "moviesandshows" ("imdb_id");

ALTER TABLE "moviesource" ADD CONSTRAINT "fk_moviesource_source_id" FOREIGN KEY("source_id")
REFERENCES "source" ("source_id");


SELECT * FROM moviesandshows;
SELECT * FROM source;
SELECT * FROM moviesource;

