require_relative 'game'
require_relative 'author'

module GameUl
  def create_game
    puts 'add a new game'
    publish_date = [(print 'Insert publish date: '), gets.rstrip][1]
    author_first = [(print 'Author first name: '), gets.rstrip][1]
    author_last = [(print 'Author last name: '), gets.rstrip][1]
    last_played_at = [(print 'Last time you played: '), gets.rstrip][1]
    multiplayer = [(print 'Does it have multiplayer?(y/n): '), gets.rstrip][1]
    game = Game.new(publish_date: publish_date, last_played_at: last_played_at, multiplayer: multiplayer)
    author = Author.new(first_name: author_first, last_name: author_last)
    author.add_item(game)
    puts ''
    puts 'Game created successfully'
    { game: game, author: author }
  end
end
