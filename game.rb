class Game
  attr_reader :player1, :player2
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current = @player1

    puts @player1 == @player1
    start_play
  end

  def start_play
    while @player1.alive? and @player2.alive?
      play
    end

    game_over
  end

  def new_turn
    puts "----- NEW TURN -----"
    if (@current == @player1)
      @current = @player2
    else
      @current = @player1
    end
  end

  def game_over
    puts " wins with a score of "
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def play
    question = Question.new
    puts "#{@current.name}: #{question.ask}"
    print "> "
    answer = $stdin.gets.chomp.to_i
    if (!question.verify_input(answer))
      @current.wrong_answer
      puts "Incorrect answer"
    else
      puts "You're correct"
    end
    new_turn
  end

end
