D.D.L.
Data Definition Language
    - This is how you define the STRUCTURE of your table
    - Basically, it lays out the COLUMNS of your table
    - All the categories of stuff you want
    - This is where we BUILD the tables

COMMON VOCAB
    • CREATE a table
    • DROP a table


-----


D.M.L.
Data Manipulation Language
    - This is how you add, edit, and delete things from the table

COMMON VOCAB
    • SELECT
    • INSERT
    • UPDATE
    • DELETE



----

HOW TO CREATE A DATABASE

1. Open up a new file
2. Type the below stuff:


CREATE TABLE playwrights (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birth_year INTEGER
);

CREATE TABLE plays (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    year INTEGER NOT NULL,
    playwright_id INTEGER NOT NULL
    
    FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
);

INSERT INTO
    playwrights (name, birth_year)
VALUES
    ('Arthur Miller', 1915),
    ('Eugene ONeil', 1999);

INSERT INTO
    plays (title, year, playwright_id)
VALUES
    ('All My Sons', 1947, (SELECT id FROM playwrights WHERE name = 'Arthur Miller'))
    ('Long Days Journey', 2012, (SELECT id FROM playwrights WHERE name = 'Eugene Oneil'));



----



3. Now, you want to create a DB FILE (unknown as of yet) for your Database  Table

So, go to the Terminal.

Type in the following command:

                                            cat import_db.sql | sqlite3 name_of_your_new_file.db

Then, open up the new DB file you just created:

                                            sqlite3 name_of_your_new_file.db



-----


OBJECT RELATIONAL MAPPING

class Play
    def self.all
    end

    def initialize
    end

    def create
    end

    def update
    end
end

