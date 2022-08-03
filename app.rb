require 'json'

require_relative 'music_album/musicui'
require './books/book_ui'
require_relative 'games/game_ul'
require_relative 'loaders'

class App
  include BookUi
  include GameUl
  include Music
  include Loader

  def initialize
    @labels = load_file1('labels')
    @authors = load_file1('authors')
    @genres = load_file1('genres')
    @books = load_file2('books')
    @games = load_file2('games')
    @music_albums = load_file2('musics')
  end

  def main_menu
    puts ''
    puts 'What would you like to do  (1 - 10)'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List of games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
  end

  def cases(command)
    return unless [1, 2, 3, 4, 5, 6, 7, 8, 9].include? command

    { 1 => -> { list_books },
      2 => -> { list_albums },
      3 => -> { list_games },
      4 => -> { list_genres },
      5 => -> { list_labels },
      6 => -> { list_authors },
      7 => -> { add_book },
      8 => -> { add_album },
      9 => -> { add_game } }[command].call
  end

  def list_books
    puts ''
    puts 'List of books'
    @books.each do |book|
      puts "Id: #{book.id} Title: #{book.label.title} Color: #{book.label.color} Publish date: #{book.publish_date}"
    end
  end

  def list_albums
    puts ''
    puts 'List of Music Albums'
    @music_albums.each do |music_album|
      puts "Id: #{music_album.id} Name: #{music_album.genre.name} " \
           "On spotify #{music_album.on_spotify} publish date #{music_album.publish_date}"
    end
  end

  def list_games
    puts ''
    puts 'List of games'
    @games.each do |game|
      puts "Id: #{game.id}, Last time played: #{game.last_played_at}, " \
           "author: #{game.author.first_name} #{game.author.last_name}, Publish date: #{game.publish_date}"
    end
  end

  def list_genres
    puts ''
    puts 'List of genres'
    @genres.each { |genre| puts "Id: #{genre.id} Title: #{genre.name}" }
  end

  def list_labels
    puts ''
    puts 'List of labels'
    @labels.each { |label| puts "Id: #{label.id} Title: #{label.title} Color: #{label.color}" }
  end

  def list_authors
    puts ''
    puts 'List of authors'
    @authors.each { |author| puts "Id: #{author.id}, first name: #{author.first_name}, last name: #{author.last_name}" }
  end

  def add_book
    data = create_book
    @books << data[:book]
    @labels << data[:label]
  end

  def add_album
    data = create_music
    @music_albums << data[:music_album]
    @genres << data[:genre]
  end

  def add_game
    data = create_game
    @games << data[:game]
    @authors << data[:author]
  end

  def save
    File.write('./json/books.json', JSON.generate(@books))
    File.write('./json/labels.json', JSON.generate(@labels))
    File.write('./json/games.json', JSON.generate(@games))
    File.write('./json/authors.json', JSON.generate(@authors))
    File.write('./json/musics.json', JSON.generate(@music_albums))
    File.write('./json/genres.json', JSON.generate(@genres))
  end
end
