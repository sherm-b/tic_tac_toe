class Board
  def initialize(p1_name = 'Player one', p2_name = 'Player two')
    @p1_name = p1_name
    @p2_name = p2_name
    @rows = {row_a: [' ',' ',' '], row_b: [' ',' ',' '], row_c: [' ',' ',' ']}
    @p1_token = 'X'
    @p2_token = 'O'
  end

  def show_board
    puts '  1   2   3 '
    puts "A #{@rows[:row_a][0]} | #{@rows[:row_a][1]} | #{@rows[:row_a][2]} "
    puts ' - - - - - -'
    puts "B #{@rows[:row_b][0]} | #{@rows[:row_b][1]} | #{@rows[:row_b][2]} "
    puts ' - - - - - -'
    puts "C #{@rows[:row_c][0]} | #{@rows[:row_c][1]} | #{@rows[:row_c][2]} "
  end

  def make_move(token)
    invalid_move = true
    until invalid_move == false
      puts 'Make your move! Input the row and column of the cell you want to play. (e.g., a1, b2, c3)'
      move_ary = gets.chomp.downcase.split('')
      if move_ary[0] == 'a' && @rows[:row_a][move_ary[1].to_i - 1] == ' '
        @rows[:row_a][move_ary[1].to_i - 1] = "#{token}"
        invalid_move = false
      elsif move_ary[0] == 'b' && @rows[:row_b][move_ary[1].to_i - 1] == ' '
        @rows[:row_b][move_ary[1].to_i - 1] = "#{token}"
        invalid_move = false
      elsif move_ary[0] == 'c' && @rows[:row_c][move_ary[1].to_i - 1] == ' '
        @rows[:row_c][move_ary[1].to_i - 1] = "#{token}"
        invalid_move = false
      else
        show_board
        puts 'Invalid Move! Try again'
      end
    end
    show_board
  end

  def winner?
    if @rows.any? {|row_name, row| row[0] != " " && row[0] == row[1] && row[1] == row[2]}
      return true
    elsif @rows[:row_a][0] != " " && @rows[:row_a][0] == @rows[:row_b][1] && @rows[:row_b][1] == @rows[:row_c][2]
      return true
    elsif @rows[:row_a][2] != " " && @rows[:row_a][2] == @rows[:row_b][1] && @rows[:row_b][1] == @rows[:row_c][0]
      return true
    end
    i = 0
    while i < 3
      if @rows[:row_a][i] != " " && @rows[:row_a][i] == @rows[:row_b][i] && @rows[:row_b][i] == @rows[:row_c][i]
        return true
      end
      i += 1
    end
    return false
  end

  def cats_game?
    cats_check = 0
    @rows.each do |row_name, row|
      if row.none? {|cell| cell == " "}
        cats_check += 1
      end
    end
    if cats_check == 3
      return true
    else
      return false
    end
  end

  def game_loop
    show_board
    loop do
      puts "#{@p1_name}'s Turn"
      make_move(@p1_token)
      if winner?
        puts "#{@p1_name} Wins!"
        break
      elsif cats_game?
        puts "Cat's game! nobody wins!"
        break
      end
      puts "#{@p2_name}'s Turn"
      make_move(@p2_token)
      if winner?
        puts "#{@p2_name} wins!"
        break
      elsif cats_game?
        puts "Cat's game! nobody wins!"
        break
      end
    end
  end

end

puts "Player 1: enter your name"
p1 = gets.chomp
puts "Player 2: enter your name"
p2 = gets.chomp

board = Board.new(p1, p2)
board.game_loop