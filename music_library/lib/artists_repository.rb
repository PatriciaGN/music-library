require_relative "./artist"

class ArtistsRepository
    def all
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
end