require_relative "./album"

class AlbumsRepository
    def all
        albums = []

        sql = "SELECT id, title, release_year, artist_id FROM albums;"
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            album = Album.new
            album.id = record["id"]
            album.title = record["title"]
            album.release_year = record["release_year"]
            album.artist_id = record["artist_id"]

            albums << album
        end
        return albums
    end

    def find(id)
        sql = 'SELECT id, title, release_year FROM albums WHERE id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]
        
        album = Album.new
        album.id = record['id']
        album.title = record['title']
        album.release_year = record['release_year']

        return album
    end

    def create(album)
        sql = "INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3)"
        sql_params = [album.title, album.release_year, album.artist_id]

        DatabaseConnection.exec_params(sql, sql_params)
        
        # album = Album.new               WE DON'T NEED ANY OF THIS AS IT IS GIVEN IN THE TEST
        # album.id = record['id']
        # album.title = record['title']
        # album.release_year = record['release_year']
        # album.artist_id = record['artist_id']

        return nil # This line is just for us to know it's not returning anything, but it's not essential
    end

    def delete(id)
        sql = "DELETE FROM albums WHERE id = $1;"
        sql_params = [id]

        DatabaseConnection.exec_params(sql, sql_params)
        
        return nil
    end
      
    def update(album)
        # Updates an album record
        # Takes an Album object (with the updated fields)
        # Executes the SQL: "UPDATE albums SET title = $1, release_year = $2 artist_id = $3, id = $4;"
        # Returns nothing (only updates the record)
     end
end