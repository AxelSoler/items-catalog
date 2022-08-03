require './games/author'

describe Author do
  context 'Testing Author class' do
    it 'An instance of Author should be created' do
      author = Author.new(first_name: 'First', last_name: 'Last')
      expect(author).to be_instance_of(Author)
    end

    it 'Should contain the appropriate instance variable first_name, last_name, items' do
      author = Author.new(first_name: 'First', last_name: 'Last')
      expect(author.first_name).to eq('First')
      expect(author.last_name).to eq('Last')
      expect(author.items).to eq([])
    end

    it 'add_item method should add an item to items property' do
      author = Author.new(first_name: 'First', last_name: 'Last')
      game = double('game')
      allow(game).to receive(:author=) { [] }
      author.add_item(game)
      expect(author.items.length).to eq(1)
    end
  end
end
