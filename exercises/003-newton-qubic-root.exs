# Упражнение 1.8 из SICP
# Для вычисления кубического корня следующее приближение вычисляем
# как ((x / y^2) + 2*y))/3

defmodule Ex do
  def cubrt(x) do
    iter(x, 1, 0)
  end

  defp iter(x, guess, prev_guess) do
    if guess_stopped_to_change?(guess, prev_guess) do
      guess
    else
      IO.puts(guess)
      iter(x, improve(guess, x), guess)
    end
  end

  defp guess_stopped_to_change?(guess, prev_guess) do
    abs(guess - prev_guess) < 0.0000001
  end

  defp improve(guess, x) do
    ((x / (guess*guess) + 2*guess)) / 3
  end
end
