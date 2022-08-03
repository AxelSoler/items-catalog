class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name:, last_name:)
    @id = Random.rand(1..100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name, 'props' => [@id, @first_name, @last_name]
    }.to_json(*args)
  end

  def self.json_create(object)
    author = new(first_name: object['props'][1], last_name: object['props'][2])
    author.id = object['props'][0]
    author
  end
end
