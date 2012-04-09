require 'board'
require 'card'

describe Board do
  before :each do
    @board = Board.new 'test'
    @card = Card.new 'Do something'
  end

  it 'should place new cards in Not Started' do
    @board << @card
    @board.get(:not_started).should include(@card)
    @board.get(:in_progress).should_not include(@card)
  end
  
  it 'should allow you to move a card to In Progress' do
    @board << @card
    @board.move @card,:in_progress
    @board.get(:in_progress).should include @card
    @board.get(:not_started).should_not include @card
  end

  it 'should be able to persist itself to a file' do
    @board << @card
    @board.persist 
    Board.load('test').get(:not_started).should include(@card)
  end

  it 'should be able to persist multiple boards' do
    board2 = Board.new 'test2'
    @board << @card
    @board.persist
    board2.persist
    Board.load('test').should == @board
    Board.load('test2').should == board2
  end

  it 'should be able to recognise two identical boards' do
    board2 = Board.new 'test'
    @board.should == board2
    @board << @card
    board2 << @card
    @board.should == board2
  end

  it 'should be able to differentiate two different boards' do
    board2 = Board.new 'test'
    @board << @card
    @board.should_not == board2
  end

  it 'should display a rudimentary board' do
    @board.move @card, :in_progress
    @board << @card
    @board.display.should == "    Not started     |    In progress     \n" +
                             "--------------------+--------------------\n" +
                             "                    |    Do something    \n"
  end
end
