module Loader
  def load_file1(file)
    File.exist?("./#{file}.json") ? JSON.parse(File.read("./#{file}.json"), create_additions: true) : []
  end

  def load_file2(file)
    if File.exist?("./#{file}.json")
      JSON.parse(File.read("./#{file}.json"), create_additions: true).map do |data|
        case file
        when 'books'
          load_books(data)
        when 'games'
          load_games(data)
        else
          puts 'wrong file'
        end
      end
    else
      []
    end
  end

  def load_books(book)
    label_id = book[:label].id
    label = @labels.filter { |lab| lab.id == label_id }.first
    book = Book.new(publish_date: book[:publish_date], publisher: book[:publisher], cover_state: book[:cover_state],
                    archived: book[:archived])
    book.label = label
    book
  end

  def load_games(game)
    author_id = game[:author].id
    author = @authors.filter { |auth| auth.id == author_id }.first
    game = Game.new(publish_date: game[:publish_date], last_played_at: game[:last_played_at],
                    multiplayer: game[:multiplayer], archived: game[:archived])
    game.author = author
    game
  end
end
