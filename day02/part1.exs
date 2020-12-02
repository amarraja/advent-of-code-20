defmodule Day02 do
  def part1(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.count(&is_valid/1)
  end

  def is_valid(line) do
    [ranges, letter, password] = String.split(line)

    [lower, upper] = ranges |> String.split("-") |> Enum.map(&String.to_integer/1)
    letter = String.replace(letter, ":", "")

    letter_freqs = password |> String.codepoints() |> Enum.frequencies()

    count = letter_freqs[letter] || 0

    valid = count >= lower && count <= upper

    valid
  end

  def part2(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.count(&is_valid_2/1)
  end

  def is_valid_2(line) do
    [ranges, letter, password] = String.split(line)

    [a, b] = ranges |> String.split("-") |> Enum.map(&String.to_integer/1)
    letter = String.replace(letter, ":", "")

    password = String.codepoints(password)
    a = Enum.at(password, a - 1) == letter
    b = Enum.at(password, b - 1) == letter

    # Can't work out boolean XOR for some reason, quick alternative
    (a || b) && a != b
  end
end

ExUnit.start()

defmodule Test do
  use ExUnit.Case

  test "examples 1" do
    input = """
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    """

    assert Day02.part1(input) == 2
    assert Day02.part2(input) == 1
  end

  test "part1" do
    File.read!("input1.txt")
    |> Day02.part1()
    |> IO.inspect(label: "part1")
  end

  test "part2" do
    File.read!("input1.txt")
    |> Day02.part2()
    |> IO.inspect(label: "part2")
  end
end
