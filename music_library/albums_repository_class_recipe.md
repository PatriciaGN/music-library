# Albums Model and Repository Classes Design Recipe

1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table students

# EXAMPLE

Table: albums

Columns:
id | title | release_year | artist_id

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.
--TRUNCATE TABLE artists RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

--INSERT INTO artists (name, genre) VALUES ('Halestorm', 'Rock')

INSERT INTO albums (title, release_year, artist_id) VALUES ('The strange case of...', '2012', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Back from the dead', '2022', '1');


psql -h 127.0.0.1 your_database_name < seeds_albums.sql


3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: albums

# Model class
# (in lib/albums.rb)
class Albums
end



4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: Albums

# Model class
# (in lib/albums.rb)

class Albums

  attr_accessor :id, :title, :release_year, :artist_id
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name
You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: albums

# Repository class
# (in lib/albums_repository.rb)
```ruby
class AlbumsRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Albums objects.
  end


end
```

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all albums
```ruby
repo = AlbumsRepository.new

albums = repo.all

albums.length #=> 2
albums.first.title #=> "The strange case of..."
albums.first.release_year #=> "2012"
albums.first.artist_id #=> "1"
```

# When there are no albums in the DB
```ruby
repo = AlbumsRepository.new

albums = repo.all #=> []
# We would need a seed that only truncates the tables but doesn't add any data.
```


  # 2
  # Get a single album

  repo = AlbumRepository.new

  album = repo.find(1)
  album.title #=> "The strange case of..."
  album.release_year #=> "2012"


# Add more examples for each method
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/album_repository_spec.rb

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end
  describe "#all" do
   it 'returns two albums' do
        repo = AlbumsRepository.new
        albums = repo.all
        expect(albums.length).to eq 2
        expect(albums.first.title).to eq "The strange case of..."
        expect(albums.first.release_year).to eq "2012"
        expect(albums.first.artist_id).to eq "1"
    end

    it "when there are no albums in the DB" do
        repo = AlbumsRepository.new
        albums = repo.all #=> []
        # We would need a seed that only truncates the tables but doesn't add any data.
    end
  end

  describe "#find" do
    it "gets a single artist" do
      repo = AlbumRepository.new

      album = repo.find(1)
      expect(album.title).to eq "The strange case of..."
      expect(album.release_year).to eq "2012"
    end
  end
end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

