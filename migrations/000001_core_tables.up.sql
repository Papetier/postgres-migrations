CREATE TABLE authors
(
    id        SERIAL PRIMARY KEY,

    email     TEXT UNIQUE,
    full_name TEXT NOT NULL
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
    id          SERIAL PRIMARY KEY,
    doi         TEXT UNIQUE,
    journal_ref TEXT UNIQUE,

    abstract    TEXT,
    title       TEXT    NOT NULL,
    year        INTEGER NOT NULL
);

CREATE TABLE eprints
(
    id       SERIAL PRIMARY KEY,

    paper_id INTEGER REFERENCES papers (id)
);

CREATE TABLE arxiv_eprints
(
    id             SERIAL PRIMARY KEY,
    arxiv_id       TEXT        NOT NULL UNIQUE,

    eprint_id      INTEGER REFERENCES eprints (id),

    comment        TEXT,
    extra          JSONB,
    latest_version INTEGER DEFAULT 1,
    pdf_link       TEXT,

    published_at   TIMESTAMPTZ NOT NULL,
    updated_at     TIMESTAMPTZ
);
COMMENT ON COLUMN arxiv_eprints.pdf_link IS 'only if different from arXiv''s default pdf location';

CREATE TABLE arxiv_groups
(
    id                        SERIAL PRIMARY KEY,

    original_arxiv_group_name TEXT NOT NULL UNIQUE
);

CREATE TABLE arxiv_archives
(
    id                          SERIAL PRIMARY KEY,

    original_arxiv_archive_code TEXT NOT NULL UNIQUE,
    original_arxiv_archive_name TEXT NOT NULL,

    arxiv_group_id              INTEGER REFERENCES arxiv_groups (id)
);

CREATE TABLE arxiv_categories
(
    id                                  SERIAL PRIMARY KEY,

    original_arxiv_category_description TEXT,
    original_arxiv_category_code        TEXT        NOT NULL UNIQUE,
    original_arxiv_category_name        TEXT        NOT NULL,

    created_at                          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at                          TIMESTAMPTZ,

    arxiv_archive_id                    INTEGER REFERENCES arxiv_archives (id)
);

CREATE TABLE arxiv_eptrins_arxiv_categories
(
    arxiv_eprint_id   INTEGER REFERENCES arxiv_eprints (id),
    arxiv_category_id INTEGER REFERENCES arxiv_categories (id),
    PRIMARY KEY (arxiv_eprint_id, arxiv_category_id),


    is_primary        BOOLEAN
);

CREATE TABLE authors_organisations
(
    author_id       INTEGER REFERENCES authors (id),
    organisation_id INTEGER REFERENCES organisations (id),
    PRIMARY KEY (author_id, organisation_id)
);

CREATE TABLE papers_authors
(
    paper_id  INTEGER REFERENCES papers (id),
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

