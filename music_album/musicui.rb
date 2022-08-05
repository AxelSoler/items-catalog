require './music_album/music'
require './music_album/genre'

module Music
  def create_music
    publish_date = [(print 'Insert publish date: '), gets.rstrip][1]
    response = [(print 'Is on spotify? [Y/N]: '), gets.rstrip][1]
    on_spotify = response.downcase == 'y'
    name = [(print 'Insert Name: '), gets.rstrip][1]
    music_album = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    genre = Genre.new(name: name)
    genre.add_item(music_album)
    puts ''
    puts 'music album created successfully'
    { music_album: music_album, genre: genre }
  end
end
