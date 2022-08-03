require_relative '../music_album/genre'
require_relative '../item'

describe 'Genre TDD' do
  context 'Add Item' do
    it 'item created' do
      genre = Genre.new(name: 'comedy')
      item = Item.new(publish_date: '12-12-2020')
      expect(genre.add_item(item)).not_to eq(nil)
    end
  end
end
