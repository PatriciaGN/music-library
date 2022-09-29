require_relative '../lib/database_connection'
require_relative '../lib/artists_repository'
require_relative '../lib/albums_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')


artists_repository = ArtistsRepository.new
albums_repository = AlbumsRepository.new

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
# artists_repository.all.each do |artist|
#   p artist
# end

# albums_repository.all.each do |album|
#   p album
# end

# artist = artists_repository.find(1)

# puts artist.name

# albums = albums_repository.find(1)

# puts albums.title


class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, albums_repository, artists_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @albums_repository = albums_repository
    @artists_repository = artists_repository
  end

  def run
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
    @io.puts "Welcome to the music library manager!"
    @io.puts ""
    @io.puts "What would you like to do?"
    @io.puts " 1 - List all albums"
    @io.puts " 2 - List all artists"
    choice = @io.gets.chomp
  
    if choice == "1"
      @io.puts "Here is a list of albums:"
      @albums_repository.all.each do |album|
        @io.puts "#{album.id} - #{album.title}" 
      end
    elsif choice == "2"
      @io.puts "Here is a list of artists:"
      @artists_repository.all.each do |artist|
        @io.puts "#{artist.id} - #{artist.name}" 
      end
    end
    
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumsRepository.new,
    ArtistsRepository.new
  )
  app.run
end