require './item'

describe Item do
  context 'Testing Item Class' do
    it 'An instance of item class should be created' do
      item = Item.new(publish_date: '01-01-1991')
      expect(item).to be_instance_of(Item)
    end
    it 'publish_date property should be 01-01-1991' do
      item = Item.new(publish_date: '01-01-1991')
      expect(item.publish_date).to eq('01-01-1991')
    end

    it 'archived property should be false for default' do
      item = Item.new(publish_date: '01-01-1991')
      expect(item.archived).to be(false)
    end

    it 'move_to_archive should return true if publish_date is 01-01-1991' do
      item = Item.new(publish_date: '01-01-1991')
      item.move_to_archive
      expect(item.archived).to be(true)
    end

    it 'move_to_archive should return false if publish_date is 01-01-2020' do
      item = Item.new(publish_date: '01-01-2020')
      item.move_to_archive
      expect(item.archived).to be(false)
    end

    it 'move_to_archive should return false if publish_date is 01-01-2012' do
      item = Item.new(publish_date: '01-01-2012')
      item.move_to_archive
      expect(item.archived).to be(false)
    end
  end

  context 'Testing custom methods ' do
    it 'label method should have an instance variable equal to the label parameter' do
      item = Item.new(publish_date: '01-01-2012')
      label = double('label')
      allow(label).to receive(:items) { [] }
      item.label = label
      expect(item.label).to eq(label)
    end

    it 'author method should have an instance variable equal to the author parameter' do
      item = Item.new(publish_date: '01-01-2012')
      author = double('author')
      allow(author).to receive(:items) { [] }
      item.author = author
      expect(item.author).to eq(author)
    end
  end
end
