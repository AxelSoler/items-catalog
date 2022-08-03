require_relative '../item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publisher:, cover_state:, **options)
    super(**options)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name, 'a' => [@id, @label, @publisher, @cover_state, @archived, @publish_date]
    }.to_json(*args)
  end

  def self.json_create(object)
    { id: object['a'][0], label: object['a'][1], publisher: object['a'][2], cover_state: object['a'][3],
      archived: object['a'][4], publish_date: object['a'][5] }
  end
  private :can_be_archived?
end
