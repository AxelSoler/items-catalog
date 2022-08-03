require 'date'

class Item
  attr_accessor :genre, :source, :archived, :id

  attr_reader :publish_date, :label, :author, :music_album

  def initialize(publish_date:, archived: false)
    @id = Random.rand(1..100)

    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  private

  def can_be_archived?
    Date.today.year - DateTime.parse(@publish_date).year > 10
  end
end
