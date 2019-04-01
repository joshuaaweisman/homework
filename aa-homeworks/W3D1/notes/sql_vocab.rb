SELECT
Retrieves values from one or more rows.
Takes in a list of comma-separated column names.

    SELECT
        name, age, has_cats
    FROMf
        tenants
    WHERE
        (has_cats = true AND age > 50)

--

FROM
Takes a table name, which is the table name that we're going ' to query.

    Structure:
        SELECT
            one or more columns (or all columns with *)
        FROM
            one or more tables (joined with JOIN)
        WHERE
            one or more conditions (joined with AND/OR);


    Examples:
        SELECT
            name, age, has_cats
        FROM
            tenants
        WHERE
            (has_cats = true AND age > 50);
        
        
        SELECT
            account_number, account_type
        FROM 
            accounts
        WHERE
            (customer_id = 5 AND account_type = 'checking')
--

WHERE
Takes a list of conditions, separated by AND or OR

    SELECT
        name, age, has_cats
    FROM
        tenants
    WHERE
        (has_cats = true AND age > 50)

--

INSERT
Inserts a row into a table

    Structure:
        INSERT INTO
            table name (column names)
        VALUES
            (values);
    
    Examples:
        INSERT INTO
            users (name, age, height_in_inches)
        VALUES
            ('Santa Claus', 876, 34);

        INSERT INTO
            accounts (account_number, customer_id, account_type)
        VALUES
            (12345, 76, 'savings');

--

UPDATE
Updates values in one or more existing rows

    Structure:
        UPDATE
            table name
        SET
            column_name_1 = value1,
            column_name_2 = value2
        WHERE
            conditions;
    
    Examples:
        UPDATE
            users
        SET
            name = 'Eddard Stark', 
            house = 'Winterfell'
        WHERE
            name = 'Ned Stark';
    
        
        UPDATE
            accounts
        SET
            balance = 30
        WHERE
            id = 6;

--

DELETE
Deletes one or more rows

    Structure:
        DELETE FROM
            table_name
        WHERE
            conditions;
    
    Examples:
        DELETE FROM
            users
        WHERE
            (name = 'Eddard Stark' AND house = 'Winterfell')
        

        DELETE FROM
            accounts
        WHERE
            customer_id = 666;

--

CREATE TABLE
Specifies the name of a new table you want to create
Then, in parentheses, the whole list of columns, along with their data types

    Example:
        CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            birth_date DATE,
            house VARCHAR(255),
            favorite_food VARCHAR(20)
        );

--

ALTER TABLE

--

DROP TABLE

--

JOIN
Temporarily joins two tables together, so you can query them both at once as if they are just one table.

ON
This is used within JOIN statements, so keep a lookout for it

    Example:
        SELECT
            users.name, posts.title
        FROM
            posts
        JOIN
            users ON posts.user_id = users.id


--

IS NULL / IS NOT NULL
Always use this instead of == NULL...just trust me, it is better this way.

--

ORDER BY

Most data is added to a database in no particular order, at least when it comes to how the colums are arranged.
Because of this, it can be tough to read bigger tables, especially when the numbers of columns are up there in the thousands / millions
So, we use the ORDER BY clause.

    SELECT 
        column, 
        another_column
    FROM 
        mytable
    WHERE 
        condition(s)
    ORDER BY 
        column ASC/DESC;


--

ASC / DESC

Ascending or descending
Use this with ORDER BY, when you want to go in alphabetical order (or reverse alphabetical order), etc.

--

LIMIT

--

DISTINCT

Sometimes, your table can contain multiple items that have the same value -- for example, if you have a table of MOVIES, there oculd be multiple movies that were made by the same DIRECTOR.
Let us say that you only want to find the specific DIRECTORS of all the movies in your list.
If you search for them, you will get a list of duplicates -- Christopher Nolan will appear multiple times, as will Quentin Tarantino, etc.
But you just want a list of all the directors -- you do not want any repeats.
So, you use DISTINCT.

    Example:
    SELECT DISTINCT director
    FROM movies
    ORDER BY director;

    This will eliminate all the duplicates from your list.
    If any director shows up twice, it will knock out the duplicates.

--

LIMIT

Let us pretend that you only want to get the first "X" number of rows, when you do a search for something.
LIMIT is how you tell the computer -- hey, only return the first "X" number of rows.

    Example:
    SELECT title
    FROM movies
    ORDER BY year
    LIMIT 4;

    In this search, you have grabbed all the movies in your database
    You have listed them by year...
    ...AND, you are only taking the first 4 of them.

--

OFFSET

When you are using LIMIT (above), sometimes you do not want to just take the first "X" number of things.
Sometimes, you want to take the SECOND "X" number of things, or the THIRD "X" number of things.
Sometimes, you want to start at item number "Y"

OFFSET is how you set the STARTING POINT of your list.

    Example:
    SELECT title
    FROM movies
    ORDER BY year
    LIMIT 4
    OFFSET 10;

    In this search, you have done the same thing that you did in LIMIT above.
    Except this time, you set your STARTING POINT at item number 10.
    So the list will still give you 4 movies, but it will start at movie number 10, and give you movies 10-13.

--

INNER JOIN
    Example:
    SELECT column, another_table_column, …
    FROM mytable
    INNER JOIN another_table 
        ON mytable.id = another_table.id
    WHERE condition(s)
    ORDER BY column, … ASC/DESC
    LIMIT num_limit OFFSET num_offset;


    Example:
    SELECT title, domestic_gross
    FROM movie_titles
    INNER JOIN box_office_numbers
        ON title_id = movie_id
    WHERE domestic_gross > 1000000
    ORDER BY domestic_gross
    LIMIT 5
    OFFSET 3;


--

IS NULL / IS NOT NULL
This is exactly what it sounds like

--

AS
This is basically how you assign something a variable name in SQL

    Example:
    SELECT number / 2.0 AS half_number  (Voila! You just assigned the variable half_
    
--


-------
-------
AGG_FUNC
This stands for AGGREGATE FUNCTION
There are a bunch of aggregate functions, like...
    • COUNT
    • MIN
    • MAX
    • AVG
    • SUM

--

GROUP BY
This is how you group together all the rows that contain the SAME VALUE, inside of a certain column that you select
    
    Example:
    SELECT MAX(years_employed)
    FROM employees
    GROUP BY title;


COUNT(*)
This counts the number of rows in a group...
...IF no column name is specified.

or

COUNT(column)
Otherwise, it counts the number of rows in the group that have a NON-NULL value in the specified column.

--

MIN(column)
Finds the smallest number in the specified column, for ALL rows in the group

-- 

MAX(column)
Same as min above, but reversed

    Example:
    SELECT MAX(years_employed) as Longest_Employment
    FROM employees;

-- 

AVG
Finds the average number in the specified column for all the rows in the group

-- 

SUM
Finds the sum of all the numbers in the specified column



----------
----------

QUERY ORDER OF EXECUTION
Here is the order that your computer executes everything:

1. FROM and JOIN
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT / OFFSET