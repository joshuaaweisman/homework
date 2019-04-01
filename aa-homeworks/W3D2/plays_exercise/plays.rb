require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)  #Play comes in as an  array? Or a table?
                                  # We write SQL, title because why?
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT 
        *
      FROM 
        plays
      WHERE title = ?
    SQL
    return nil unless play.length > 0  #????? What is play referring to here? #The table?
    Play.new(play.first) #????? What is play referring to here?
  end

  def self.find_by_playwright(name)    #???? Why are we assuming 
      plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)

      SELECT 
        title
      FROM 
        playwrights
      JOIN 
        PLAYS on id = playwright_id
      WHERE 
        name = ?
      
    SQL
    plays.map { |play| Play.new(play) }  #????? WHAT IS THIS FOR, and what is plays referring to
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end


class Playwright
    attr_accessor :id, :name, :birth_year

    def self.all
      data = PlayDBConnection.instance.execute("SELECT * FROM plays")  #????? Comes in as arrays?
      data.map { |datum| Play.new(datum) }  #????? Turn each array into a new instance, using WHAT?
    end

    def self.find_by_name(name)
      PlayDBConnection.instance.execute(<<-SQL self.name, self.birth_year)
        SELECT
          *
        FROM
          playwrights
        WHERE
          name = ?
      SQL
    end

    def initialize(options)
      @id = options['id']
      @name = options['name']
      @birth_year = options['birth_year']
    end

    def create #????? Why is there no argument passed in here?
      if self.id #????? What 
        raise "Sorry, that person is already in the database."
      end

      PlayDBConnection.instance.execute(<<-SQL self.name, self.birth_year)
        INSERT INTO
          playwrights (name, birth_year)
        VALUES
          (?, ?)
      SQL

      self.id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
      if !self.id
        raise "Sorry, that person isn't in the database."
      end

      PlayDBConnection.instance.execute(<<-SQL self.name, self.birth_year, self.id)
        UPDATE
          playwrights
        SET
          name = ?, birth_year = ?
        WHERE
          id = ?
      SQL
    end

    def get_plays
      if !self.id
        raise "Sorry, that play isn't on the list."
      end

      PlayDBConnection.instance.execute(<<-SQL self.name, self.birth_year, self.id)
        SELECT
          *
        FROM
          play
      SQL
    end
end
