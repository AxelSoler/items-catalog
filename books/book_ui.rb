require './books/book'
require './books/label'

module BookUi
  def create_book
    title = [(print 'Insert Title: '), gets.rstrip][1]
    color = [(print 'Insert Color: '), gets.rstrip][1]
    publish_date = [(print 'Insert Publish Date [DD-MM-YYYY]: '), gets.rstrip][1]
    publisher = [(print 'Insert Publisher: '), gets.rstrip][1]
    cover_state = [(print 'Insert the cover state [good,bad]: '), gets.rstrip][1]
    book = Book.new(publish_date: publish_date, publisher: publisher, cover_state: cover_state)
    label = Label.new(title: title, color: color)
    label.add_item(book)
    puts ''
    puts 'Book created successfully'
    { book: book, label: label }
  end
end
