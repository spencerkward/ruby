require 'pstore'
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
    board.load
    board
  end

  def persist
    store = PStore.new(filename)
    store.transaction do
      store[:allcards] = Array.new
      @cards.each{|card| store[:allcards] << card}
    end
  end

  def load
    store = PStore.new(filename)
    store.transaction do
      @cards = store[:allcards]
    end
  end

  def filename
    "#{@name}.store"
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
