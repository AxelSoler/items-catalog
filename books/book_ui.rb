require './books/book'
require './books/label'
require './games/author'
require './music_album/genre'
require './commom_ui'

module BookUi
  include CommonUI
  def create_book
    puts 'add a new book'
    props = common_properties
    publisher = [(print 'Insert Publisher: '), gets.rstrip][1]
    cover_state = [(print 'Insert the cover state [good,bad]: '), gets.rstrip][1]
    book = Book.new(publish_date: props[:publish_date], publisher: publisher, cover_state: cover_state)
    label = Label.new(title: props[:title], color: props[:color])
    author = Author.new(first_name: props[:author_first], last_name: props[:author_last])
    genre = Genre.new(name: props[:genre_name])
    label.add_item(book)
    author.add_item(book)
    genre.add_item(book)
    puts ''
    puts 'Book created successfully'
    { book: book, label: label, author: author, genre: genre }
  end
end
