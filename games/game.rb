require_relative '../item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(last_played_at:, multiplayer:, **options)
    super(**options)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name, 'props' => [@id, @author, @last_played_at, @multiplayer, @archived,
                                                     @publish_date, @label, @genre]
    }.to_json(*args)
  end

  def self.json_create(object)
    { id: object['props'][0], author: object['props'][1], last_played_at: object['props'][2],
      multiplayer: object['props'][3], archived: object['props'][4],
      publish_date: object['props'][5], label: object['props'][6], genre: object['props'][7] }
  end

  private

  def can_be_archived?
    super && (Date.today.year - DateTime.parse(@last_played_at).year > 2)
  end
end
