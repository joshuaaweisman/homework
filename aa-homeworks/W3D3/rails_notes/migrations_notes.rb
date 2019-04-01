1. IN TERMINAL

type the following command:

'
rails new Project_name -d postgresql
'


---


2. IN YOUR RAILS PROJECT

add a new gem to your Gemfile

This is located in:
    Project_name / Gemfile

The gem you want to add is called 'pry-rails'

This gem allows you to use Pry with the Rails environment

Type this into your gemfile:

    '
    gem 'pry-rails'
    '


---



3. IN TERMINAL

cd into the folder of your Project Name

Run 'bundle install'

This will allow you to use all the updated Gems in your Gemfile.



---



4. IN TERMINAL
cd into the folder of your project name
Type the following command:

'
    rails generate migration CreateCatsTable   <-- (just an example name)
'                                   ^
                                    ^
                                 Creates a file
                                 called a MIGRATION.
                                 This file is going to
                                 create a new SQL table
                                 in your database. What
                                 you do in this file
                                 allows you to add tables
                                 to your database.

                        

----



5. IN VS CODE
Find your migration file (the one you just created using rails generate migration)

This file is located in:

                        '
                        Project_File / db / migrations
                        '

It''s probably called something like:

                        '
                        20160518225354_create_cats_table.rb
                        '


----


6. IN VS CODE
We are going to want to edit this MIGRATION file.

But first, take a look at what is written in it:

            class CreateCatsTable < ActiveRecord::Migration
                def change
                    create_table :cats do |t|

                    end
                end
            end



----


7. WHAT DOES THIS CODE DO?
It allows you to add new columns to your table.

So, add some stuff into the code, and create a new column for your table called cats:

            # class CreateCatsTable < ActiveRecord::Migration
            #     def change
            #         create_table :cats do |t|

                        t.string :name, null: false     #<<- This creates a new column called 'name' in your 'cats' column. The code 'null: false' is a HASH, and it forces you to give every cat a name -- you can't have a cat in your table with a name that equals NULL.
                        t.timestamps                    #<<- This 'table.timestamps' command AUTO-GENERATES two columns in your 'cats' table -- a CREATED AT column, and an UPDATED AT column. This keeps track of when the row was created, and when it was updated.

            #         end
            #     end
            # end


----



8. IN TERMINAL
Run your migration, to make sure it is working.

Make sure you are in the right folder, and type the following:

                        '
                        rake db:migrate
                        '

ERROR!!! OH NO.

The error message looks like this:

                        '
                        PG::ConnectionBad: FATAL: database "Cats_development" does not exist
                        '

This is because you have not set up a database yet, and your MIGRATION is trying to add columns to it.

How about we fix it right now:


----


9. IN VS CODE
Make sure you create a database first.

Go to the following file:

                    '
                    config / database.yml
                    '

Scroll down until you see some code that looks like this:

                    development:
                        <<: *default
                        database: Cats_development

Uh-oh...it looks like Rails is trying to access a database called Cats_development, but that database does not exist.


----


10. IN TERMINAL
Create the database that your MIGRATE needs in order to run.

In terminal, type the following code:

                    '
                    rake db:create
                    '
        
Voila! You created your brand new database.

Now, run the migration again (returning back to 'STEP NUMBER 8'):

                    '
                    rake db:migrate
                    '

Boom. It works, and now you have just added two new columns to your table.


----


11. IN VS CODE
Check to make sure your new columns were added.

The current state of your database is always in your SCHEMA FILE, located in the following place:

                    '
                    Cats / db / schema.rb
                    '

Check out that file, and you will see the following code:

                    create_table "cats", force: :cascade do |table|
                        table.string "name", null: false
                        table.datetime "created_at"
                        table.datetime "updated_at"
                    end

Boom. This means that your table now has three columns:

                    • name
                    • created_at
                    • updated_at


----

12. IN TERMINAL
Generate a new table (aka, a new MIGRATION)

Type the following command into Terminal

                        '
                        rails g migration CreateToys
                        '

Great. You just created a brand new MIGRATION (aka table).


----


13. IN VS CODE
Again, find your migration file (the one you just created using rails generate migration)

This file is located in:

                        '
                        Project_File / db / migrations
                        '

It''s probably called something like:

                        '
                        20160518225354_create_toys.rb
                        '


----


14. IN VS CODE
We are going to want to edit this MIGRATION file.

But first, take a look at what is written in it:

            class CreateToys < ActiveRecord::Migration
                def change
                    create_table :toys do |t|
                        
                    end
                end
            end



----


15. WHAT DOES THIS CODE DO?
It allows you to add new columns to your table.

So, add some stuff into the code, and create a new column for your table called cats:

            # class CreateToys < ActiveRecord::Migration
            #     def change
            #         create_table :toys do |t|

                        t.string :name, null: false     #<<- This creates a new column called 'name' in your 'toys' column. The code 'null: false' is a HASH, and it forces you to give every toy a name -- you can't have a toy in your table with a name that equals NULL.
                        t.timestamps                    #<<- This 'table.timestamps' command AUTO-GENERATES two columns in your 'toys' table -- a CREATED AT column, and an UPDATED AT column. This keeps track of when the row was created, and when it was updated.

            #         end
            #     end
            # end

----


16. IN TERMINAL
Run your migration, and make sure it is working.

Make sure you are in the right folder, and type the following:

                        '
                        rake db:migrate
                        '

Boom. It works, and now you have just added two new columns to your table.


----


17. IN TERMINAL
Imagine that we want to change something in the CreateToys table we just made.

You might think that we should just change our code in VS Code, and then run 'rake db:migrate' again.

YOU ARE WRONG!

Before you can make any changes, you need to do what is called a ROLLBACK.

This will "undo" your last migration, so that you can make new changes to your code and migrate again, with fresh changes this time.

To do a ROLLBACK, type the following command into terminal:

                        '
                        rake db:rollback
                        '

----


18. IN VS CODE
Now that you have done your rollback, you can go back into your MIGRATION file, and make whatever changes you need.

So again, find your migration file (the one you just created using rails generate migration)

This file is located in:

                        '
                        Project_File / db / migrations
                        '

It''s probably called something like:

                        '
                        20160518225354_create_toys.rb
                        '


----


19.
Add some new stuff into Migration File code, like whatever changes you want to make:

            # class CreateToys < ActiveRecord::Migration
            #     def change
            #         create_table :toys do |t|

                        # t.string :name, null: false
                        t.integer :cat_id, null: false    #<< Create a new column, called "cat_id", which is an integer
                        # t.timestamps                   

            #         end
            #     end
            # end

----


20. IN TERMINAL
Run your migration one last time, and make sure it is working.

Make sure you are in the right folder, and type the following:

                        '
                        rake db:migrate
                        '

Boom. It works, and now you have just added two new columns to your table.



----
----
----
----
----




MIGRATION EXAMPLE

class Create Products < ActiveRecord::Migration[5.1
    def up
        create_table :products do |t|
            t.string :name
            t.text :description

            t.timestamps
        end
    end


    def down
        drop_table :products
    end
end]


-----


CREATE TABLE
This will be one of your workhorses. It looks like this:

create_table :products do |t|
    t.string :name
    t.float :price

    t.timestamps
end


OTHER TABLE MIGRATIONS

add_column :table_name, :column_name, :type, options_hash
remove_column :table_name, :column_name
rename_column :table_name, :old_column_name, :new_column_name
rename_table :old_table_name, :new_table_name
add_index :table_name, [:column1, :column2], options_hash
change_column :table_name, :column_name, :type, options_hash


-----