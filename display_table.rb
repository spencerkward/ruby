class DisplayTable
  CELL_WIDTH = 20

  def initialize
    @columns = []
    @output = ""
    @column_data = {}
  end

  def add_column name
    @columns << name
  end

  def append_to_column column, data
    @column_data[column] ||= []
    @column_data[column] << data
  end

  def to_s
    @output = ""
    put_header
    put_data
    @output
  end

  def put_header
    @columns.each {|column| @output << to_cell(column) << "|"}
    end_of_row
    @columns.each {|column| @output << to_cell("-" * CELL_WIDTH) << "+"}
    end_of_row
  end

  def end_of_row
    @output.chop! << "\n"
  end

  def put_data
    row = 0
    while true do
      more = put_row row
      break if !more
      row += 1
    end
  end
  
  def put_row row 
    @columns.each do |column| 
      column_data = @column_data[column]
      cell_data = column_data == nil ? nil : column_data[row]
      cell_data ||= " "
      @output << to_cell(cell_data) << "|"
    end
    end_of_row
    false
  end

  def to_cell content
    content.center(CELL_WIDTH).slice(0, CELL_WIDTH)
  end
end
