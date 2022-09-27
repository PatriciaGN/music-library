require_relative 'lib/database_connection'
require_relative 'lib/artists_repository'
require_relative 'lib/albums_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')


artists_repository = ArtistsRepository.new
albums_repository = AlbumsRepository.new

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
artists_repository.all.each do |artist|
  p artist
end

albums_repository.all.each do |album|
  p album
end

artist = artists_repository.find(1)

puts artist.name

albums = albums_repository.find(1)

puts albums.title