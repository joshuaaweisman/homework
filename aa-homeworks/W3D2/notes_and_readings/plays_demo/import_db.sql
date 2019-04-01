
CREATE TABLE plays (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    year INTEGER NOT NULL,
    playwright_id INTEGER NOT NULL
);

CREATE TABLE playwrights (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birth_year INTEGER
);

INSERT INTO
    playwrights (name, birth_year)
VALUES
    ('Arthur Miller', 1915),
    ('Eugene ONeil', 1999);

INSERT INTO
    plays (title, year, playwright_id)
VALUES
    ('The Matrix', 1999, (SELECT id FROM playwrights WHERE name = 'Arthur Miller')),
    ('Pain And Gain', 2008, (SELECT id FROM playwrights WHERE name = 'Eugene ONeil'));
