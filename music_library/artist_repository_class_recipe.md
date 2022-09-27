# Albums Model and Repository Classes Design Recipe

1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table students

# EXAMPLE

Table: albums

Columns:
id | name | genre

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.
```sql
-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Halestorm', 'Rock')


psql -h 127.0.0.1 your_database_name < seeds_artists.sql
```

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: artists

# Model class
# (in lib/artist.rb)
class Artist
end



4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: Artists

# Model class
# (in lib/artist.rb)

class Artist
  attr_accessor :id, :name, :genre
end


5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: artists

# Model class
# (in lib/artist.rb)
```ruby
class Artist
  attr_accessor :id, :name, :genre
end
```

# Repository class
# (in lib/artists_repository.rb)
```ruby
class ArtistsRepository

  # Selecting all artists
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;

    # Returns an array of Artist objects.
  end
  
  # Select a single record
  # Given the id in argument (a number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists WHERE id = $1
    # Returns a single artist object
end
```

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all albums
```ruby
repo = ArtistsRepository.new

artists = repo.all

artists.length #=> 1
artists.first.name #=> "Halestorm"
artists.first.genre #=> "Rock"
```

# When there are no albums in the DB
```ruby
repo = ArtistsRepository.new

artists = repo.all #=> []
# We would need a seed that only truncates the tables but doesn't add any data.
```


  # 2
  # Get a single artist

  repo = ArtistRepository.new

  artist = repo.find(1)
  artist.name #=> "Halestorm
  artist.genre #=> "Rock"
```


# Add more examples for each method
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_albums_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do 
    reset_artists_table
  end
  
  # 1
  # Gets all artists

  repo = ArtistsRepository.new

  artists = repo.all
  artists.length #=> 1
  artists.first.id #=> "1"
  aerists.first.name #=> "Halestorm"

  # 2
  # Get a single artist

  repo = ArtistRepository.new

  artist = repo.find(1)
  artist.name #=> "Halestorm
  artist.genre #=> "Rock"


end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

