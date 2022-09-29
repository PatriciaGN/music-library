require_relative '../lib/artists_repository.rb'

RSpec.describe ArtistsRepository do   
  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  describe ArtistsRepository do
    before(:each) do 
      reset_artists_table
    end

    it 'returns the list of artists' do
        repo = ArtistsRepository.new
        artist = repo.all
        expect(artist.length).to eq 1
        expect(artist.first.name).to eq "Halestorm"
        expect(artist.first.genre).to eq "Rock"
    end

    it "gets a single artist" do
       repo = ArtistsRepository.new
       artist = repo.find(1)
       expect(artist.name).to eq "Halestorm"
       expect(artist.genre).to eq "Rock"
    end
   end

   describe "#Create" do
    it "adds a new artist to the table" do
      repository = ArtistsRepository.new

      artist = Artist.new
      artist.name = "Beetles"
      artist.genre = "Pop"

      repository.create(artist)

      all_artists = repository.all
      last_artist = all_artists.last

      expect(artist.name).to eq "Beetles"
      expect(artist.genre).to eq "Pop"
    end
  end

  describe "#Delete" do
    it "deletes artist with id 1" do
      repo = ArtistsRepository.new

      id_to_delete = 1

      repo.delete(id_to_delete)

      all_artists = repo.all
      expect(all_artists.length).to eq 1
    end
  end

  describe "#update" do
    it "updates a artist" do
        repo = UsersRepository.new

        artist = repo.find(1)

        artist.name = "updated name"
        artist.genre "updated genre"
        
        repo.update(artist)

        updated_artist = repo.find(1)

        expect(updated_artist.name).to eq "updated name" 
        expect(updated_artist.genre).to eq "updated genre" 
    end
  end
end