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
end
