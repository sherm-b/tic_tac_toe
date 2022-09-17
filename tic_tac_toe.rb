class Board
  def initialize(p1_name = 'Player one', p2_name = 'Player two')
    @p1_name = p1_name
    @p2_name = p2_name
  end
  @rows = {row_a: [' ',' ',' '], row_b: [' ',' ',' '], row_c: [' ',' ',' ']}
  @p1_token = 'X'
  @p2_token = 'O'

  def show_board
    puts '  1   2   3 '
    puts "A #{@rows[:row_a][0]} | #{@rows[:row_a][1]} | #{@rows[:row_a][2]} "
    puts ' - - - - - -'
    puts "B #{@rows[:row_b][0]} | #{@rows[:row_b][1]} | #{@rows[:row_b][2]} "
    puts ' - - - - - -'
    puts "C #{@rows[:row_c][0]} | #{@rows[:row_c][1]} | #{@rows[:row_c][2]} "
  end

  def make_move(token)
    puts 'Make your move! Input the row and column of the cell you want to play.'
    move_ary = gets.chomp.downcase.split('')
    if move_ary[0] == 'a' && @rows[:row_a][move_ary[1].to_i - 1] == ' '
      @rows[:row_a][move_ary[1].to_i - 1] = "#{token}"
    elsif move_ary[0] == 'b' && @rows[:row_b][move_ary[1].to_i - 1] == ' '
      @rows[:row_b][move_ary[1].to_i - 1] = "#{token}"
    elsif move_ary[0] == 'c' && @rows[:row_c][move_ary[1].to_i - 1] == ' '
      @rows[:row_c][move_ary[1].to_i - 1] = "#{token}"
    else
      puts 'Invalid Move!'
    end
    show_board
  end

  def winner?
    if @rows.each do {|row_name, row| row.all? {|cell| cell == 'X' || cell == 'O'}}
      return true
    elsif @rows[:row_a][0] != " " && @rows[:row_a][0] == @rows[:row_b][1] && @rows[:row_b][1] == @rows[:row_c][2]
      return true
    elsif @rows[:row_a][2] != " " && @rows[:row_a][2] == @rows[:row_b][1] && @rows[:row_b][1] == @rows[:row_c][0]
      return true
    end
    i = 0
    while i > 3
      if @rows[:row_a][i] == @rows[:row_b][i] && @rows[:row_b][i] == @rows[:row_c][i]
        return true
      end
    end
    return false
  end

end

