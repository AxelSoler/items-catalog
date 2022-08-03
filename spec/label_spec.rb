require './books/label'

describe Label do
  context 'Testing Label class' do
    it 'An instance of Label should be created' do
      label = Label.new(title: 'title', color: 'color')
      expect(label).to be_instance_of(Label)
    end

    it 'Should contain the appropriate instance variable title, color, items' do
      label = Label.new(title: 'title', color: 'color')
      expect(label.title).to eq('title')
      expect(label.color).to eq('color')
      expect(label.items).to eq([])
    end

    it 'add_item method should add an item to items property' do
      label = Label.new(title: 'title', color: 'color')
      book = double('book')
      allow(book).to receive(:label=) { [] }
      label.add_item(book)
      expect(label.items.length).to eq(1)
    end
  end
end
