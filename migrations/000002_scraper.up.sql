BEGIN;

-- Colly tables
CREATE TABLE IF NOT EXISTS colly_storage_visited_pages
(
    request_id TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS colly_storage_cookies
(
    host    TEXT NOT NULL,
    cookies TEXT NOT NULL
);

-- Source websites
CREATE TABLE websites
(
    id            SERIAL PRIMARY KEY,

    domain_list   TEXT NOT NULL,
    name          TEXT UNIQUE
);
COMMENT ON COLUMN websites.domain_list IS 'comma-separated list of allowed domains';

INSERT INTO websites(name, domain_list)
VALUES ('arXiv',
        'arxiv.org,export.arxiv.org');

COMMIT;
