require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')


artist_repository = ArtistsRepository.new
albums_repository = AlbumsRepository.new

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
artist_repository.all.each do |artist|
  p artist
end

album_repository.all.each do |album|
  p album
end

