class Player
  attr_reader :name

  def initialize(name)
    @lives = 3
    @name = name
  end

  def wrong_answer
    @lives -= 1
  end

  def alive?
    @lives > 0
  end

  def show_lives
    puts ""
  end
end