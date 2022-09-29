require "app"

def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library' })
    connection.exec(seed_sql)
end
def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library' })
    connection.exec(seed_sql)
end



describe Application do 
    before(:each) do
        reset_albums_table
        reset_artists_table
    end
      

    it "runs" do
        io = double :io
        albums_repository = AlbumsRepository.new
        artists_repository = ArtistsRepository.new

        expect(io).to receive(:puts).with("Welcome to the music library manager!")
        expect(io).to receive(:puts).with("")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with(" 1 - List all albums")
        expect(io).to receive(:puts).with(" 2 - List all artists")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Here is a list of albums:")
        expect(io).to receive(:puts).with("1 - The strange case of...")
        expect(io).to receive(:puts).with("2 - Back from the dead")

        app = Application.new("music_library", io, albums_repository, artists_repository)
        app.run
    end
end
        