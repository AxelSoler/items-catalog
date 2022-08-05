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
      JSON.create_id => self.class.name, 'props' => [@id, @label, @publisher, @cover_state, @archived, @publish_date,
                                                     @author, @genre]
    }.to_json(*args)
  end

  def self.json_create(object)
    { id: object['props'][0], label: object['props'][1], publisher: object['props'][2], cover_state: object['props'][3],
      archived: object['props'][4], publish_date: object['props'][5],
      author: object['props'][6], genre: object['props'][7] }
  end
  private :can_be_archived?
end
