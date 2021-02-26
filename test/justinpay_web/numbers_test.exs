
defmodule Justinpay.NumbersTest do
  use ExUnit.Case

  alias Justinpay.Numbers

  describe "sum_from_file/1" do
    test "when there's a file with the given name, returns the sum of content numbers" do
      response = Numbers.sum_from_file("numbers")
      expected = "banana"
      assert response == expected
    end

    test "when there's NO file with the given name, returns error" do
      response = Numbers.sum_from_file("asdf")
      expected = "banana"
      assert response == expected
    end
  end
end
