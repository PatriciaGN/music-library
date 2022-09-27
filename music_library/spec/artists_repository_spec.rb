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
end