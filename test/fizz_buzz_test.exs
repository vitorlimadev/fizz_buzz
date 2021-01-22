defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "main/1" do
    test "when a valid file is provided, returns converted list." do
      expected = {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz, :fizz_buzz, :buzz]}

      assert FizzBuzz.main("numbers.txt") == expected
    end

    test "when an invalid file is provided, returns converted list." do
      expected = {:error, "Error while reading the file: enoent"}

      assert FizzBuzz.main("invalid.txt") == expected
    end
  end
end
