CREATE TABLE websites
(
    id            SERIAL PRIMARY KEY,

    domain        TEXT,
    init_url_list TEXT,
    name          TEXT UNIQUE
);
COMMENT ON COLUMN websites.init_url_list IS 'comma-separated list of initial urls';

INSERT INTO websites(name, domain, init_url_list)
VALUES ('arXiv',
        'arxiv.org',
        'https://arxiv.org/');

