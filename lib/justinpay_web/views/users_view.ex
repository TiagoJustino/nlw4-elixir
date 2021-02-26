defmodule JustinpayWeb.UsersView do
  alias Justinpay.User
  alias Justinpay.Account

  def render("create.json", %{user: %User{account: %Account{balance: balance}, id: id, name: name, nickname: nickname}}) do
    %{
      message: "User create",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        balance: balance
      }
    }
  end
end
