class TicTacToe
  attr_reader :player1, :player2, :entries

  def initialize
    puts 'Welcome to Tic-Tac-Toe!'
    @entries = Array.new(9, '*')
    @board =
      "======
        a b c
      1 * * *
      2 * * *
      3 * * *
        "
    @choice = nil
    @player1 = 'crosses'
    @player2 = 'noughts'
  end

  def won?
    temp = @entries.take(3)
    return true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }

    temp = @entries[3..5]
    return true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }

    temp = @entries.drop(6)
    return true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }

    temp = @entries.values_at(0, 3, 6)
    return true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }

    temp = @entries.values_at(1, 4, 7)
    return true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }

    temp = @entries.values_at(2, 5, 8)
    return true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }

    temp = @entries.values_at(0, 4, 8)
    return true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }

    temp = @entries.values_at(2, 4, 6)
    true if temp.all? { |tile| tile == 'X' } || temp.all? { |tile| tile == 'O' }
  end

  def tie?
    @entries.none? { |tile| tile == '*' }
  end

  def board
    puts @board
  end

  def gets_player_choice
    puts "Enter a tile: e.g 'a1', 'c3'"
    @choice = gets
    @choice = @choice.chomp
    @choice = gets until choice_valid?
    @choice
  end

  def update_board(choice, player)
    if player == 'crosses'
      @entries[convert_choice(choice)] = 'X'
    elsif player == 'noughts'
      @entries[convert_choice(choice)] = 'O'
    end

    @board =
      "======
        a b c
      1 #{@entries[0]} #{@entries[1]} #{@entries[2]}
      2 #{@entries[3]} #{@entries[4]} #{@entries[5]}
      3 #{@entries[6]} #{@entries[7]} #{@entries[8]}
      "
  end

  def choice_valid?
    until %w[a1 a2 a3 b1 b2 b3 c1 c2 c3].include?(@choice)
      p 'invalid tile'
      p "input letter then number e.g 'a1', 'c3'"
      @choice = gets
      @choice = @choice.chomp
    end

    until @entries[convert_choice(@choice)] == '*'
      puts 'tile already occupied'
      @choice = gets
      @choice = @choice.chomp
    end
    true
  end

  def convert_choice(choice)
    case choice
    when 'a1'
      0
    when 'b1'
      1
    when 'c1'
      2
    when 'a2'
      3
    when 'b2'
      4
    when 'c2'
      5
    when 'a3'
      6
    when 'b3'
      7
    when 'c3'
      8
    else
      p 'choice not recognized'
    end
  end
end
