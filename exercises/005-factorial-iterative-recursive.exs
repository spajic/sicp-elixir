# Пример из 1.2.1.
# Рекурсивно-итеративное вычисление факториала

# Тут в отличие от линейно-рекурсивного варианта
# не происходит накопления отложенных вычислений.
#
# В этом варианте интерпретатору нужны только значения accum, counter, n
# стек не нужен
#
# В общем случае, итеративный процесс можно описать конечным числом переменных состояния
#  плюс правило перехода от шага к шагу
#  плюс тест на завершение
#
# В обычных языках типа Pascal и C рекурсия, которая присутствует в этом описании
# реализуется так, что память всё равно будет линейно разбухать.
# Поэтому им необходимы инструкции циклов вроде for и while.
#
# В Scheme, Elixir и других функциональных (и не только) языках есть "Хвостовая рекурсия"
# оптимизация, которая позвволяет выполнять рекурсивные итерации с фиксированной памятью
defmodule Ex do
  def factorial(n) do
    iter(1, 1, n)
  end

  defp iter(accum, counter, n) do
    if counter > n do
      accum
    else
      iter(accum * counter, counter + 1, n)
    end
  end
end
