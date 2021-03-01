defmodule Justinpay.Users.CreateTest do
  use Justinpay.DataCase, async: true

  alias Justinpay.User
  alias Justinpay.Users.Create

  describe "call/1" do
    test "when all params are valid, return a user" do
      params = %{
        name: "Justino",
        password: "12345",
        nickname: "justino",
        email: "a@a.com",
        age: 5
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Justino", age: 5, id: ^user_id} = user
    end

    test "when there are invalid params, return an error" do
      params = %{
        name: "Justino",
        password: "12345",
        nickname: "justino",
        age: 5
      }

      {:error, changeset} = Create.call(params)

      expected = %{email: ["can't be blank"]}

      assert errors_on(changeset) == expected
    end
  end
end
