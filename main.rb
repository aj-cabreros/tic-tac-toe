require_relative 'lib/tic_tac_toe'

game = TicTacToe.new

until game.won?
  game.board
  puts "Player1's (Crosses) turn:"
  game.update_board(game.gets_player_choice, game.player1)
  if game.won?
    game.board
    puts 'Player1 wins!'
    break
  end

  if game.tie?
    game.board
    puts "It's a tie!"
    break
  end

  game.board
  puts "Player2's (Noughts) turn:"
  game.update_board(game.gets_player_choice, game.player2)
  if game.won?
    game.board
    puts 'Player2 wins!'
  end

end

puts 'Thanks for playing!'
