require_relative 'music_album/musicui'
require './book_ui'
require_relative 'game_ul'
require 'json'

class App
  include BookUi
  include GameUl
  include Music
  attr_reader :status

  def initialize
    @labels = File.exist?('./labels.json') ? JSON.parse(File.read('./labels.json'), create_additions: true) : []
    @books = if File.exist?('./books.json')
               JSON.parse(File.read('./books.json'), create_additions: true).map do |book|
                 load_books(book)
               end
             else
               []
             end
    @albums = []
    @games = []
    @genres = []
    @authors = []
  end

  def main_menu
    puts ''
    puts('-----------------------------------')
    puts "\nWelcome to Item Catalog App!!\n\n"
    puts('-----------------------------------')
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
    @books.each do |book|
      puts "Id: #{book.id} Title: #{book.label.title} Color: #{book.label.color} Publish date: #{book.publish_date}"
    end
  end

  def list_albums
    @music_albums.each do |music_album|
      print "Id: #{music_album.id}, Name: #{music_album.genre.name}, " \
            "On spotify #{music_album.on_spotify}, publish date #{music_album.publish_date}"
    end
  end

  def list_games
    puts 'List of games'
    @games.each do |game|
      puts "Id: #{game.id}, Last time played: #{game.last_played_at}, " \
           "author: #{game.author.first_name} #{game.author.last_name}, Publish date: #{game.publish_date}"
    end
  end

  def list_genres
    @genres.each { |genre| puts "Id: #{genre.id} Title: #{genre.name}" }
  end

  def list_labels
    @labels.each { |label| puts "Id: #{label.id} Title: #{label.title} Color: #{label.color}" }
  end

  def list_authors
    puts 'List of authors'
    @authors.each { |author| puts "Id: #{author.id} first name: #{author.first_name}, last name: #{author.last_name}" }
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

  def save_books_labels
    File.write('books.json', JSON.generate(@books))
    File.write('labels.json', JSON.generate(@labels))
  end

  def load_books(book)
    label_id = book[:label].id
    label = @labels.filter { |lab| lab.id == label_id }.first
    book = Book.new(publish_date: book[:publish_date], publisher: book[:publisher], cover_state: book[:cover_state],
                    archived: book[:archived])
    book.label = label
    book
  end
end
