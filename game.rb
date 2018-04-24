class Game
  attr_reader :player1, :player2
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current = @player1
    start_play
  end

  def start_play
    while @player1.alive? and @player2.alive?
      play
    end
    game_over
  end

  def new_turn
    if (@current == @player1)
      @current = @player2
    else
      @current = @player1
    end
  end

  def game_over
    puts "#{@current.name} wins with a score of #{@current.show_lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def play
    question = Question.new
    puts "----- NEW TURN -----"
    puts "#{@current.name}: #{question.ask}"
    print "> "
    answer = $stdin.gets.chomp.to_i
    if (!question.verify_input(answer))
      @current.wrong_answer
      puts "#{@current.name}: Incorrect answer"
      puts "P1: #{@player1.show_lives} vs P2: #{@player2.show_lives}"
    else
      puts "#{@current.name}: You're correct"
      puts "P1: #{@player1.show_lives} vs P2: #{@player2.show_lives}"
    end
    new_turn
  end

end
