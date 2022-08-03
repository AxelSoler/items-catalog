require './books/book'

class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title:, color:)
    @id = rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name, 'a' => [@id, @title, @color]
    }.to_json(*args)
  end

  def self.json_create(object)
    label = new(title: object['a'][1], color: object['a'][2])
    label.id = object['a'][0]
    label
  end
end
