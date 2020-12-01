defmodule Day01 do
  def part1(input) do
    input =
      input
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    [{x, y} | _] = for x <- input, y <- input, x + y == 2020, do: {x, y}
    x * y
  end
end

ExUnit.start()

defmodule Test do
  use ExUnit.Case

  test "examples 1" do
    input = """
    1721
    979
    366
    299
    675
    1456
    """

    assert Day01.part1(input) == 514_579
  end

  test "part1" do
    File.read!("input1.txt")
    |> Day01.part1()
    |> IO.inspect(label: "part1")
  end
end
