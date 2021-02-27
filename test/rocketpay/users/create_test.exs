defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.{User, Users.Create, Repo}

  describe "call/1" do
    test "when all params are valid, returns user" do
      params = %{
        name: "John",
        password: "password",
        nickname: "doe",
        email: "johndoe@example.com",
        age: 30
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{
               id: ^user_id,
               name: "John",
               nickname: "doe",
               email: "johndoe@example.com",
               age: 30
             } = user
    end

    test "when all params are invalid, returns error" do
      params = %{
        name: "John",
        nickname: "doe",
        email: "johndoe@example.com",
        age: 15
      }

      expected_errors = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      {:error, changeset} = Create.call(params)

      assert errors_on(changeset) == expected_errors
    end
  end
end
