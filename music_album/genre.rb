require_relative '../item'

class Genre
  attr_accessor :name, :id, :items

  def initialize(name:)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items.push(item)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name, 'props' => [@id, @name]
    }.to_json(*args)
  end

  def self.json_create(object)
    genre = new(name: object['props'][1])
    genre.id = object['props'][0]
    genre
  end
end
