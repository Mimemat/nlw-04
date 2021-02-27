defmodule Rocketpay.NumbersTest do
  use ExUnit.Case, async: true

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "When the file exists, returns the sum of the file's numbers" do
      response = Numbers.sum_from_file("numbers")

      assert response == {:ok, %{result: 37}}
    end

    test "When the file does not exists, returns an error" do
      response = Numbers.sum_from_file("banana")

      assert response == {:error, %{message: "Invalid file"}}
    end
  end
end
