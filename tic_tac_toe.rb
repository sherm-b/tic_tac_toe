class Board
  def initialize(p1_name="Player one", p2_name="Player two")
    @row_a = [" "," "," "]
    @row_b = [" "," "," "]
    @row_c = [" "," "," "]
    @p1_name = p1_name
    @p2_name = p2_name
  end
  def show_board
    puts "  1   2   3 "
    puts "A #{@row_a[0]} | #{@row_a[1]} | #{@row_a[2]} "
    puts " - - - - - -"
    puts "B #{@row_b[0]} | #{@row_b[1]} | #{@row_b[2]} "
    puts " - - - - - -"
    puts "C #{@row_c[0]} | #{@row_c[1]} | #{@row_c[2]} "
  end
  def make_move
    puts "Make your move! Input the row and column of the cell you want to play."
    move_ary = gets.chomp.downcase.split("")
    if move_ary[0] == "a" && @row_a[move_ary[1].to_i - 1] == " "
      @row_a[move_ary[1].to_i - 1] = 'X'
    elsif move_ary[0] == "b" && @row_b[move_ary[1].to_i - 1] == " "
      @row_b[move_ary[1].to_i - 1] = 'X'
    elsif move_ary[0] == "c" && @row_c[move_ary[1].to_i - 1] == " "
      @row_c[move_ary[1].to_i - 1] = 'X'
    else
      puts "Invalid Move!"
    end
    show_board
  end
end