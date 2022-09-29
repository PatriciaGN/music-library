require_relative "./artist"

class ArtistsRepository
    def all
        # Selects all records, no arguments
        # Executes the SQL query "SELECT id, name, genre FROM artists;"
        # Returns an array of Artist objects
        artists = []

        sql = "SELECT id, name, genre FROM artists;"
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |each_artist|
            artist = Artist.new
            artist.id = each_artist["id"]
            artist.name = each_artist["name"]
            artist.genre = each_artist["genre"]

            artists << artist
        end
        return artists
    end

    def find(id)
        sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]
        
        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']

        return artist
    end

    def create(artist)
        sql = "INSERT INTO artists (name, genre) VALUES ($1, $2);"
        sql_params = [artist.name, artist.genre]

        DatabaseConnection.exec_params(sql, sql_params)
        
        return nil # This line is just for us to know it's not returning anything, but it's not essential
    end

    def delete(id)
        sql = "DELETE FROM artists WHERE id = $1;"
        sql_params = [id]

        DatabaseConnection.exec_params(sql, sql_params)
        
        return nil
    end
end