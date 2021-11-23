CREATE TABLE websites
(
    id            SERIAL PRIMARY KEY,

    domain_list   TEXT NOT NULL,
    init_url_list TEXT,
    name          TEXT UNIQUE
);
COMMENT ON COLUMN websites.init_url_list IS 'comma-separated list of initial urls';
COMMENT ON COLUMN websites.domain_list IS 'comma-separated list of allowed domains';

INSERT INTO websites(name, domain_list, init_url_list)
VALUES ('arXiv',
        'arxiv.org,export.arxiv.org',
        'http://export.arxiv.org/api/query?id_list=cs/9901002v1%2C0904.2860v1');

