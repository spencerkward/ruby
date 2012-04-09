require 'display_table'

class Board
  attr_reader :cards
  attr_reader :name

  def initialize name
    @name = name
    @cards = []
  end
  
  def self.load name
    board = Board.new name
    File.read(name+".txt").each {|line| board << Card.from_s(line)}
    board
  end

  def << card
    @cards << card
  end

  def get column
    @cards.select {|card| card.state == column}
  end

  def move card, column
    card.state = column
  end

  def persist
    File.open(@name+".txt", 'w') {|file| file.write to_s}
  end

  def states 
    Set.new([:not_started, :in_progress])
  end

  def display
    table = DisplayTable.new
    states.each {|state| table.add_column(nice_string state)}
    @cards.each {|card| table.append_to_column(nice_string(card.state), card.description)}
    table.to_s
  end
  
  def nice_string state
    state.to_s.sub("_", " ").capitalize
  end
  
  def to_s
    @cards.each {|card| card.to_s}
  end

  def == other 
    @name == other.name && @cards == other.cards
  end
end
