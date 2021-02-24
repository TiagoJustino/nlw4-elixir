defmodule JustinpayWeb.UsersView do
  alias Justinpay.User

  def render("create.json", %{user: %User{id: id, name: name, nickname: nickname}}) do
    %{
      message: "User create",
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end
end
