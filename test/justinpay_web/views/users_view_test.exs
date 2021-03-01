defmodule JustinpayWeb.UsersViewTest do
  use JustinpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Justinpay.User
  alias JustinpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Justino",
      password: "12345",
      nickname: "justino",
      email: "a@a.com",
      age: 5
    }

    {:ok, %User{id: user_id} = user} = Justinpay.create_user(params)
    response = render(UsersView, "create.json", user: user)

    expected = %{
      message: "User create",
      user: %{balance: Decimal.new("0.00"), id: user_id, name: "Justino", nickname: "justino"}
    }

    assert expected == response
  end
end
