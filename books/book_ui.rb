require './books/book'
require './books/label'

module BookUi
  def create_book
    puts 'Insert Title'
    title = gets.chomp
    puts 'Insert Color'
    color = gets.chomp
    puts 'Insert Publish Date [DD-MM-YYYY]'
    publish_date = gets.chomp
    puts 'Insert Publisher'
    publisher = gets.chomp
    puts 'Insert the cover state [good,bad]'
    cover_state = gets.chomp.downcase
    puts 'Is it archived?: [Yes/No]'
    archived = gets.chomp
    book = Book.new(publish_date: publish_date, publisher: publisher, cover_state: cover_state, archived: archived)
    label = Label.new(title: title, color: color)
    label.add_item(book)
    { book: book, label: label }
  end
end
