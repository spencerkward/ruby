require 'display_table'

describe DisplayTable do
  before :each do
    @table = DisplayTable.new
  end

  it 'should handle empty cells correctly' do
    @table.add_column 'First'
    @table.add_column 'Second'
    @table.append_to_column 'Second', 'Data 2'
    
    @table.to_s.should == "       First        |       Second       \n" +
                          "--------------------+--------------------\n" +
                          "                    |       Data 2       \n";
  end
  it 'should print a two column one row table correctly' do
    @table.add_column 'First'
    @table.add_column 'Second'
    @table.append_to_column 'First', 'Data 1'
    @table.append_to_column 'Second', 'Data 2'

    @table.to_s.should == "       First        |       Second       \n" +
                          "--------------------+--------------------\n" +
                          "       Data 1       |       Data 2       \n";
  end
end
