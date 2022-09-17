class Board
  def initialize(p1_name = 'Player one', p2_name = 'Player two')
    @rows = {row_a: [' ',' ',' '], row_b: [' ',' ',' '], row_c: [' ',' ',' ']}
    @p1_name = p1_name
    @p2_name = p2_name
  end

  def show_board
    puts '  1   2   3 '
    puts "A #{@rows[:row_a][0]} | #{@rows[:row_a][1]} | #{@rows[:row_a][2]} "
    puts ' - - - - - -'
    puts "B #{@rows[:row_b][0]} | #{@rows[:row_b][1]} | #{@rows[:row_b][2]} "
    puts ' - - - - - -'
    puts "C #{@rows[:row_c][0]} | #{@rows[:row_c][1]} | #{@rows[:row_c][2]} "
  end

  def make_move
    puts 'Make your move! Input the row and column of the cell you want to play.'
    move_ary = gets.chomp.downcase.split('')
    if move_ary[0] == 'a' && @rows[:row_a][move_ary[1].to_i - 1] == ' '
      @rows[:row_a][move_ary[1].to_i - 1] = 'X'
    elsif move_ary[0] == 'b' && @rows[:row_b][move_ary[1].to_i - 1] == ' '
      @rows[:row_b][move_ary[1].to_i - 1] = 'X'
    elsif move_ary[0] == 'c' && @rows[:row_c][move_ary[1].to_i - 1] == ' '
      @rows[:row_c][move_ary[1].to_i - 1] = 'X'
    else
      puts 'Invalid Move!'
    end
    show_board
  end
end

board = Board.new
board.show_board
board.make_move