# sicp-elixir

# Глава 1. Построение абстракций с помощью процедур
LISP - от LISt Processing, изобретён в 1960 Джоном Маккарти в MIT.

В книге используется диалект Scheme (1975)

Ключевая особеность - продцедура является данными, современным языком - function is a first-class citizen.

## 1.1. Элементы программирования
В каждом ЯП есть
- элементарные выражения
- средства комбинирования
- средства абстракци - называть сложные объекты и обращаться с ними как с единым целым, абстрагируясь от деталей

### 1.1.1. Выражения
Начнём с выполнения нескольких простых примеров в интерпретаторе.

Самое заметное отличие Lisp - префиксная форма записи выражений и скобочки

```scheme
100
100

(+ 100 200)
300

(/ 10 5)
2.0

(+ 21 35 12 7)
75

(+ (* 3 5) (- 10 6))
19
```


```bash
brew install elixir # на Mac ставится одной командой через homebrew

elixir -v
# Erlang/OTP 22 [erts-10.7] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe] [dtrace]
# Elixir 1.10.2 (compiled with Erlang/OTP 22)

iex # interactive interpretator (REPL)
```

```
Interactive Elixir (1.10.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 100
100
iex(2)> 'abc'
'abc'
iex(3)> 100 + 200
300
iex(4)> 10 / 5
2.0
```

### 1.1.2. Имена и окружение

В Scheme `define` - простейшее средство абстракции, даёт возможность называть сложные объекты.

```scheme
(define size 2)

size
2

(* 5 size)
10
```

В `elixir` именование тесно связано с `pattern-matching`-ом

Оператор `=` - не присваивание, а сопоставление с шаблоном (the match operator).

```
x = 1
1

1 = x
1

2 = x
** (MatchError) no match of right hand side value: 1

x = 2
2

# присваивание работает только когда имя в левой части выражения
```

### 1.1.3. Вычисление комбинаций

В scheme очень простое рекурсивное правило вычисления комбинаций (operator operand1 operand2 operandN):

- Вычислить все подвыражения комбинации
- Применить оператор к аргументам

### 1.1.4. Составные процедуры

Более мощная возможность абстракции - дать имя составной процедуре и использовать её.

```scheme
(define (square x) (* x x))

(square 2)
4

(define (sum-of-squares x y )
  (+ (square x) (square y)))

(sum-of-squares 3 4)
25
```

В `elixir` это называется `функциями`, функции объединяются в `модули`

```elixir
defmodule My do
  def square(x) do
    x * x
  end

  def sum_of_squares(x, y) do
    square(x) + square(y)
  end
end

My.square(3)
9

My.sum_of_squares(3, 4)
25
```

### 1.1.6. Условные выражения и предикаты

```scheme
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
  )

# Вариант cond с else
(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

# Вариант if с else
(define (abs x)
  (if (< x 0)
      (- x)
      x))


```

В `elixir` точно так же

```elixir
defmodule My do
  def abs(x) do
    cond do
      x > 0 ->
        x
      x == 0 ->
        0
      x < 0 ->
        -x
      true ->
        "This is equivalent to else"
    end
  end

  # Вариант с if else (есть так же unless)
  def abs(x) do
    if x < 0 do
      -x
    else
      x
    end
  end

  # Вариант if else с блочной записью
  def abs(x) do
    if x < 0, do: -x, else: x
  end
end
```

Логические операторы

```scheme
(and e1 e2 e3)
(or e1 e2 e3)
(not e)
```

```elixir
and, or, not # принимают только булевы типы справа и слева, иначе выкидывают ошибку
&&, ||, ! # принимает любые типы, за ложь считает nil и false, всё остальное за истину
```

### 1.1.7. Пример: вычисление квадратного корня методом Ньютона
См exercises 001, 002, 003
Прекрасный пример выражения итерации без циклов for и счётчиков, через рекурсию.

### 1.1.8 Процедуры как абстракции типа "чёрный ящик"
Локальные переменные

Внутренние определения процедур в Scheme.

```scheme
(define (sqrt x)
  (define (good-enough? guess x))
  ...
)
```

В `scheme` ещё переменная x доступна для всех внутренний процедур в блоке, нет необходимости передавать её аргументом.

В `Elixir` используем `defp` для определения приватной функции


## 1.2. Процедуры и порождаемые ими процессы
