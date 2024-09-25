require_relative 'lib/tic_tac_toe'

game = TicTacToe.new

until game.won?
  game.board
  puts 'Player1\'s (Crosses) turn:'
  puts 'type "q" to quit'
  game.update_board(game.gets_player_choice, game.player1)
  if game.won?
    game.board
    puts 'Player1 wins!'
    break
  end

  break if game.exit_early?

  if game.tie?
    game.board
    puts "It's a tie!"
    break
  end

  game.board
  puts 'Player2\'s (Noughts) turn:'
  puts 'type "q" to quit'
  game.update_board(game.gets_player_choice, game.player2)
  if game.won?
    game.board
    puts 'Player2 wins!'
  end

  break if game.exit_early?

end

puts 'Thanks for playing!'
