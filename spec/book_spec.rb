require './books/book'

describe Book do
  context 'Testing Book Class' do
    it 'An instance of Book class should be created' do
      book = Book.new(publish_date: '01-01-1991', publisher: 'Private', cover_state: 'Good', archived: 'Yes')
      expect(book).to be_instance_of(Book)
    end
    it 'Should contain the appropriate instance variables publish_date, publisher, cover_state and archived' do
      book = Book.new(publish_date: '01-01-1991', publisher: 'Private', cover_state: 'Good', archived: 'Yes')
      expect(book.publish_date).to eq('01-01-1991')
      expect(book.cover_state).to eq('Good')
      expect(book.archived).to eq('Yes')
    end

    it 'can_be_archived? method should return true if publish_date = 01-01-2015 and cover_state = Good' do
      book = Book.new(publish_date: '01-01-2015', publisher: 'Private', cover_state: 'Good', archived: 'Yes')
      result = book.send(:can_be_archived?)
      expect(result).to be(false)
    end

    it 'can_be_archived? method should return true if publish_date = 01-01-1990 and cover_state = Good' do
      book = Book.new(publish_date: '01-01-1990', publisher: 'Private', cover_state: 'Good', archived: 'Yes')
      result = book.send(:can_be_archived?)
      expect(result).to be(true)
    end

    it 'can_be_archived? method should return true if publish_date = 01-01-2015 and cover_state = bad' do
      book = Book.new(publish_date: '01-01-2015', publisher: 'Private', cover_state: 'bad', archived: 'Yes')
      result = book.send(:can_be_archived?)
      expect(result).to be(true)
    end
  end
end
