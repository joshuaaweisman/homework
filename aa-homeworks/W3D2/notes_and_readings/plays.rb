require 'sqlite3'
require 'singleton'

# This class creates a DIRECT CONNECTION to our database
class PlayDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('plays.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end


class Play
    attr_accessor :title, :year, :playwright_id

    #Shows us every play that we have in our database
    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM plays") #Remember, up in the PlayDBConnection class, we included the Singleton module. That means there is only one of this thing, ever, for the rest of time. We use ".instance" to create it.
                                                                        #Then, we use ".execute" to actually MAKE the connection to our database.
                                                                        #And then, we open up parentheses (), and we use SQL to show the whooooole table. (SELECT * FROM plays)
                                                                        #WHAT WILL THIS RETURN?
                                                                        #Well, right now, it will return an array of all the data in our table. THAT'S UGLY.
                                                                        #IMPORTANT TO NOTE: "data" is an array of arrays.
                                                                        #So, let's turn it into something better -- an INSTANCE of the PLAY CLASS:
        
        data.map {|datum| Play.new(datum)}                              #Iterate over all those sub-arrays
                                                                        #Perfect! Now, each of our little sub-arrays has been transformed into an INSTANCE OF THE PLAY CLASS.
    end


    #Creates a new instance of the Play class
    def initialize(options)                                             #We pass in a HASH called 'options' -- this is DATUM, right up above in self.all.
        
        @id = options['id']                                             #We unpack the options hash, and pull all the columns out, and store them in instance variables.
        @title = options['title']                                       #We save each of these 
        @year = options['year']
        @playwright_id = options['playwright_id']
    end


    #This allows us to save a play instance to our database
    def create
        raise "#{self} is already in the database" if @id               #If someone tries to initialize a BRAND NEW play object, then that brand new play object is NOT already in our table (aka, our database).
                                                                        #This means it does NOT already have an @id instance variable (aka, @id is set to nil)
                                                                        #(NOTE: If the Play Object was coming from our database directly, it WOULD have an @id)
                                                                        #So, we run a check -- and raise an error if this Play Object is already in the database.
    
        PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)                       
                                                                        #This just pulls up our database, so we can connect to it...
                                                                        #...and then uses that fancy <<- thing to start writing SQL inside of it.
                                                                        #NOTE: Everything inside this <<-SQL tag is going to be read as a STRING.
            INSERT INTO
                plays (title, year, playwright_id)
            VALUES
                (?, ?, ?)                                               #Each of these '?' marks represents one of the @things on LINE 50...@title, @year, @playwright_id
                                                                        #The reason we do it this way is because we want to prevent against cyber attacks
        SQL
        @id = PlayDBConnection.instance.last_insert_row_id              # Once we've created our new Play Object, we want to give it an ID (because remember, that's the primary key in our database)
                                                                        # And we want to throw that id into our database, in the ID column.
                                                                        # So, we connect with out Database again (using PlayDBConnection.instance)
                                                                        # "last_insert_row_id" = this gets us the ID of the last row inserted into the database (what the fuck that means, no idea)
    end


    #This allows us to change the information in our table, in case we make a mistake or something
    def update
        raise "#{self} is NOT in the database" unless @id                               # Make sure this instance
        PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)   # Connect to the database
            UPDATE                                                                      # Now, update the 'plays' table...
                plays
            SET                                                                         # ...with all the values that we just set with the @instance_variables on LINE 70 (each of the question marks represents one of these instance variables)
                title = ?, year = ?, playwright_id = ?
            WHERE  
                id = ?                                                                  # Then, find that row by its ID
        SQL
    end

end