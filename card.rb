class Card
  SEPARATOR = ';'
  attr_accessor :state
  attr_accessor :description

  def initialize description
    @state = :not_started
    @description = description
  end

  def self.from_s text
    card = Card.new ''
    bits = text.split SEPARATOR
    card.state = bits[0].to_sym
    card.description = bits[1]
    card
  end

  def to_s
    @state.to_s + SEPARATOR + description
  end

  def == other
    other.state == @state && other.description == description
  end
end
