1. IN VS CODE
Check out your schema, and see what tables you have.

Your schema is located at the following place:

            '
            Cats / db / schema.rb
            '

----


2. IN VS CODE
Read your schema, to see which tables you currently have in your database.

Right now, if you have any tables, they should look like this:

            create_table "cats", force: :cascade do |t|
                t.string "name", null: false
                t.datetime "created_at"
                t.datetime "updated_at"
                t.string "color"
            end

            create_table "toys", force: :cascade do |t|
                t.string "name", null: false
                t.integer "cat_id" null: false
                t.datetime "created_at"
                t.datetime "updated_at"
            end

Great! You have two tables, "cats" and "toys." They both have a few columns.


----

3. IN VS CODE
I want to have a way to interact with these tables, using RUBY OBJECTS.

In order to do that, I need to make a new MODEL.

Head over to your 'models' folder, and create a new 'model':

Location:

            '
            Cats / app / models / cat.rb
            '

(NOTE: You just created a new file called cat.rb)

This new file is a MODEL of a Cat.


----


4. IN VS CODE
Create a Cat class inside of your "cat" model.

Right now, the file "cat.rb" should be empty.

Fill it with a brand new Cat class:

            class Cat < ApplicationRecord
            end

NOTE: ApplicationRecord (^right up there^) is an "intermediary class", that acts as a parent to your Cat class.

The parent of ApplicationRecord is the ActiveRecord::Base class.

Using this "intermediary class" makes it so we do not have to monkey-patch the ActiveRecord::Base class directly -- instead, we can just modify the ApplicationRecord class if we need to.


----


5. IN TERMINAL
Now, you want to play around with your Cat class in the Rails console.

To open up the Rails console, type the following command in terminal:

            '
            rails console
            '

----


6. IN TERMINAL
Create a new Cat object.

First, call the Cat class. Type this into the terminal:

            '
            Cat
            '
        
You should see a response like this:

                '
                => Cat (call 'Cat.connection' to establish a connection)
                '

Great. Now, create a new instance of Cat:

            '
            test_cat = Cat.new
            '

And the console returns your new cat object:

                '
                => #<Cat: 0x007ffe7d23e280 id: nil, name: nil, created_at: nil, updated_at: nil, color: nil>
                '
        
----


7. IN TERMINAL
Add this new cat into your Cats table (aka, add it into your database)

First, give the test_cat a name. Type this into the terminal:

            '
            test_cat.name = "Toothless"
            '
    
Great. Now, SAVE this cat into your database. Type this into the terminal:

            '
            test_cat.save
            '

Voila! You have just saved your new cat into the Cats table.


----


8. IN TERMINAL
After you have created your cat object, pull some properties from the database and give them to the cat directly.

Right now, your cat object (test_cat) has JUST a name -- no other properties (like id, created_at, and updated_at) from the Cats table.

So now, give test_cat some properties from the table.

Type the following command into Terminal:

            '
            test_cat = Cat.first
            '

Let us break down what this command does:

            1. 'test_cat' <- This is the cat object you created
            2. '=' <- You are setting some properties to this test_cat...
            3. 'Cat.first' <-...directly from your Cats table, specifically the FIRST ROW of your cats table.

            So now, test_cat is going to have the name Toothless...
            ...and will ALSO have whatever properties were in the FIRST ROW of the Cats table.

Take a look at test_cat now:

            '
            test_cat

                => #<Cat: 0x007ffe7d23e280 
                        id: 1, 
                        name: "Toothless", 
                        created_at: Wed, 18 May 2016 23:58:30 UTC +00:00, 
                        updated_at: Wed, 18 May 2016 23:58:30 UTC +00:00, 
                        color: nil>
            '

----


9. IN TERMINAL
Instantiate a new cat object, without having to give it all its properties "after the fact"

Type into Terminal:

            '
            mushu = Cat.new(name: "Mushu", color: "red")    
            '
                              ^              ^
                              ^              ^
                              ^              ^
                          Remember -- 'name' and 'color'
                          are columns in our Cats table


-----


10. IN TERMINAL
Save your new cat to the database:

            '
            mushu.save
            '


----


11. IN TERMINAL
Check for ALL of the cats in your database:

            '
            Cat.all


                => #<Cat: 0x007ffe7d23e280 
                    id: 1, 
                    name: "Toothless", 
                    created_at: Wed, 18 May 2016 23:58:30 UTC +00:00, 
                    updated_at: Wed, 18 May 2016 23:58:30 UTC +00:00, 
                    color: nil>


                => #<Cat: 0x007ffe7d23e280 
                    id: 2, 
                    name: "Mushu", 
                    created_at: Wed, 18 May 2017 23:58:30 UTC +00:00, 
                    updated_at: Wed, 18 May 2017 23:58:30 UTC +00:00, 
                    color: red>
            '


----

12. IN TERMINAL
Remove one of the cats from the database.

First, you want to drop Mushu down to the END of your table:

            '
            mushu = Cat.last
            '

Then, you want to delete Mushu completely:

            '
            mushu.destroy
            '


----
----
----
----
----


ENUMERABLES TO KNOW

    • Class.all --> Returns an array of Class objects, one for each row in the class table
    
    • Class.find(key_number) --> Returns the Class object with the primary key id of 'key_number'

    • Class.where(column_name: 'value_in_that_space') --> Return an array of Class Objects that are in the specified COLUMN, with a value of 'value_in_that_space'

    • object.save! --> Saves your object to the database as a brand new row

    • object.create! ( column_name: 'value_in_that_space', column_name: 'value_in_that_space') --> Automatically creates a class object, and saves it to your database as a row

    • object.destroy --> Deletes your object from the database as a row.
    