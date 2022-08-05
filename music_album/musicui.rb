require './music_album/music'
require './music_album/genre'
require './books/label'
require './commom_ui'
require './games/author'

module Music
  include CommonUI
  def create_music
    props = common_properties
    response = [(print 'Is on spotify? [Y/N]: '), gets.rstrip][1]
    on_spotify = response.downcase == 'y'
    music_album = MusicAlbum.new(publish_date: props[:publish_date], on_spotify: on_spotify)
    genre = Genre.new(name: props[:genre_name])
    label = Label.new(title: props[:title], color: props[:color])
    author = Author.new(first_name: props[:author_first], last_name: props[:author_last])
    genre.add_item(music_album)
    label.add_item(music_album)
    author.add_item(music_album)
    puts ''
    puts 'music album created successfully'
    { music_album: music_album, genre: genre, label: label, author: author }
  end
end
