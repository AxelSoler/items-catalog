require './games/game'
require './games/author'
require './books/label'
require './music_album/genre'
require './commom_ui'

module GameUl
  include CommonUI
  def create_game
    puts 'add a new game'
    props = common_properties
    last_played_at = [(print 'Last time you played: '), gets.rstrip][1]
    multiplayer = [(print 'Does it have multiplayer?(y/n): '), gets.rstrip][1]
    game = Game.new(publish_date: props[:publish_date], last_played_at: last_played_at, multiplayer: multiplayer)
    label = Label.new(title: props[:title], color: props[:color])
    author = Author.new(first_name: props[:author_first], last_name: props[:author_last])
    genre = Genre.new(name: props[:genre_name])
    author.add_item(game)
    label.add_item(game)
    genre.add_item(game)
    puts ''
    puts 'Game created successfully'
    { game: game, author: author, label: label, genre: genre }
  end
end
