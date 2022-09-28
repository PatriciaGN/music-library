require_relative '../lib/albums_repository.rb'

RSpec.describe AlbumsRepository do   
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end
  
  describe AlbumsRepository do
    before(:each) do 
      reset_albums_table
    end

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

    describe "#find" do
        it "gets a single artist" do
          repo = AlbumsRepository.new
    
          album = repo.find(1)
          expect(album.title).to eq "The strange case of..."
          expect(album.release_year).to eq "2012"
        end
    end

    describe "#create" do
      it "creates a new album object with its atributes" do
        repository = AlbumsRepository.new

        album = Album.new
        album.title = "Trompe le Monde"
        album.release_year = 1991
        album.artist_id = 1

        repository.create(album)

        all_albums = repository.all

        expect(all_albums).to include album
      end
   end
  end
end