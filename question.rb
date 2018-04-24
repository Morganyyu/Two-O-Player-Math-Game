class Question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def ask
    "What does #{@num1} plus #{@num2} equal?"
  end

  def verify_input(guess)
    @num2 + @num1 == guess
  end

end

# something = Question.new
# puts something.verify_input($stdin.gets.chomp.to_i)