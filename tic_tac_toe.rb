class Board
  def initialize(p1_name="Player one", p2_name="Player two")
    @row_a = [" "," "," "]
    @row_b = [" "," "," "]
    @row_c = [" "," "," "]
    @p1_name = p1_name
    @p2_name = p2_name
  end
  def show_board
    puts " #{@row_a[0]} | #{@row_a[1]} | #{@row_a[2]} "
    puts "- - - - - -"
    puts " #{@row_b[0]} | #{@row_b[1]} | #{@row_b[2]} "
    puts "- - - - - -"
    puts " #{@row_c[0]} | #{@row_c[1]} | #{@row_c[2]} "
  end
end