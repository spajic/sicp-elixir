# Упражнение 1.7 из SICP
# Реализация good_enough? из примера 001 не очень эффективна для больших и малых чисел
# Лучше заканчивать алгоритм, когда guess пактичечки перестал меняться

defmodule Ex do
  def sqrt(x) do
    sqrt_iter(x, 1, 0)
  end

  def sqrt_iter(x, guess, prev_guess) do
    if guess_stopped_to_change?(guess, prev_guess) do
      guess
    else
      sqrt_iter(x, improve(guess, x), guess)
    end
  end

  def guess_stopped_to_change?(guess, prev_guess) do
    abs(guess - prev_guess) < 0.0000001
  end

  def improve(guess, x) do
    (guess + x/guess) / 2
  end
end
