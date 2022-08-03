require_relative '../music_album/music'

describe 'music_album TDD' do
  context 'Create music album' do
    it 'album created' do
      music_album = MusicAlbum.new(publish_date: '12-12-2000', on_spotify: true)
      expect(music_album.id).to be > 0
    end
  end
  context 'Can be archived?' do
    it 'correct response' do
      music_album = MusicAlbum.new(publish_date: '12-12-2000', on_spotify: true)
      expect(music_album.can_be_archived?).to eq(true)
    end
  end
end
