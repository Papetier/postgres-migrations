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

    category_list TEXT,
    domain_list   TEXT NOT NULL,
    init_url_list TEXT,
    name          TEXT UNIQUE
);
COMMENT ON COLUMN websites.category_list IS 'comma-separated list of categories to scrape';
COMMENT ON COLUMN websites.domain_list IS 'comma-separated list of allowed domains';
COMMENT ON COLUMN websites.init_url_list IS 'comma-separated list of initial urls';

INSERT INTO websites(name, category_list, domain_list, init_url_list)
VALUES ('arXiv',
        'cs.AI,cs.AR,cs.CC,cs.CE,cs.CG,cs.CL,cs.CR,cs.CV,cs.CY,cs.DB,cs.DC,cs.DL,cs.DM,cs.DS,cs.ET,cs.FL,cs.GL,cs.GR,cs.GT,cs.HC,cs.IR,cs.IT,cs.LG,cs.LO,cs.MA,cs.MM,cs.MS,cs.NA,cs.NE,cs.NI,cs.OH,cs.OS,cs.PF,cs.PL,cs.RO,cs.SC,cs.SD,cs.SE,cs.SI,cs.SY',
        'arxiv.org,export.arxiv.org',
        '');

COMMIT;
