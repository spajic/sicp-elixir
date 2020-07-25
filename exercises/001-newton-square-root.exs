# Пример 1.1.7 из SICP

# Пусть искомый корень из числа x равен y
# Строим итерацию:
#   - берём начальное приближение y
#   - следующее значение = (y + x/y) / 2

# Корень из 2
# Приближение | Частное x/y | Среднее
# 1           | 2/1 = 2     | (1 + 2) / 2 = 1.5
# 1.5         | 2/1.5 = 1.33| (1.5 + 1.33) / 2 = 1.4167
# ...

defmodule Ex do
  # Вычисляет корень из x, от начального приближения 1
  def sqrt(x) do
    sqrt_iter(x, 1)
  end

  def sqrt_iter(x, guess) do
    if good_enough?(guess, x) do
      guess
    else
      sqrt_iter(x, improve(guess, x))
    end
  end

  def good_enough?(guess, x) do
    myabs(x - guess * guess) < 0.0001
  end

  def improve(guess, x) do
    (guess + x/guess) / 2
  end

  # Метод abs есть из коробки
  def myabs(x) do
    if x < 0, do: -x, else: x
  end
end
