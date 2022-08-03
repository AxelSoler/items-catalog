module Loader
  def load_file1(file)
    File.exist?("./json/#{file}.json") ? JSON.parse(File.read("./json/#{file}.json"), create_additions: true) : []
  end

  def load_file2(file)
    if File.exist?("./json/#{file}.json")
      JSON.parse(File.read("./json/#{file}.json"), create_additions: true).map do |data|
        case file
        when 'books'
          load_books(data)
        when 'games'
          load_games(data)
        when 'musics'
          load_musics(data)
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
    book_id = book[:id]
    label = @labels.filter { |lab| lab.id == label_id }.first
    book = Book.new(publish_date: book[:publish_date], publisher: book[:publisher], cover_state: book[:cover_state],
                    archived: book[:archived])
    book.id = book_id
    book.label = label
    book
  end

  def load_games(game)
    author_id = game[:author].id
    game_id = game[:id]
    author = @authors.filter { |auth| auth.id == author_id }.first
    game = Game.new(publish_date: game[:publish_date], last_played_at: game[:last_played_at],
                    multiplayer: game[:multiplayer], archived: game[:archived])
    game.id = game_id
    game.author = author
    game
  end

  def load_musics(music)
    genre_id = music[:genre].id
    music_id = music[:id]
    genre = @genres.filter { |gen| gen.id == genre_id }.first
    music = MusicAlbum.new(publish_date: music[:publish_date], on_spotify: music[:on_spotify])
    music.id = music_id
    music.genre = genre
    music
  end
end
