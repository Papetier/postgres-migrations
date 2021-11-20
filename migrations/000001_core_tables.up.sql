CREATE TABLE authors
(
    id         SERIAL PRIMARY KEY,

    email      TEXT UNIQUE,
    first_name TEXT NOT NULL,
    last_name  TEXT NOT NULL
);

CREATE TABLE organisations
(
    id   SERIAL PRIMARY KEY,

    name TEXT NOT NULL UNIQUE
);

CREATE TABLE publishers
(
    id   SERIAL PRIMARY KEY,

    name TEXT NOT NULL UNIQUE,
    url  TEXT NOT NULL UNIQUE
);

CREATE TABLE venues
(
    id   SERIAL PRIMARY KEY,

    name TEXT NOT NULL UNIQUE
);

CREATE TABLE papers
(
    id         SERIAL PRIMARY KEY,
    eprint     TEXT       NOT NULL UNIQUE,
    doi        TEXT       NOT NULL UNIQUE,

    abstract   TEXT,
    pdf_link   TEXT,
    title      TEXT       NOT NULL,
    year       INTEGER,

    created_at timestamptz NOT NULL,
    updated_at timestamptz,
    deleted_at timestamptz
);

CREATE TABLE authors_organisations
(
    author_id       INTEGER REFERENCES authors (id),
    organisation_id INTEGER REFERENCES organisations (id),
    PRIMARY KEY (author_id, organisation_id)
);

CREATE TABLE papers_authors
(
    paper_id     INTEGER REFERENCES papers (id),
    author_id INTEGER REFERENCES authors (id),
    PRIMARY KEY (paper_id, author_id)
);

CREATE TABLE papers_publishers
(
    paper_id     INTEGER REFERENCES papers (id),
    publisher_id INTEGER REFERENCES publishers (id),
    PRIMARY KEY (paper_id, publisher_id)
);

CREATE TABLE papers_venues
(
    paper_id INTEGER REFERENCES papers (id),
    venue_id INTEGER REFERENCES venues (id),
    PRIMARY KEY (paper_id, venue_id)
);


