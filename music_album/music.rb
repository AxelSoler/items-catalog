require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify:, **options)
    super(**options)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name, 'props' => [@id, @genre, @on_spotify, @publish_date]
    }.to_json(*args)
  end

  def self.json_create(object)
    { id: object['props'][0], genre: object['props'][1], on_spotify: object['props'][2],
      publish_date: object['props'][3] }
  end

  def can_be_archived?
    return true if super and on_spotify == true

    false
  end
end
