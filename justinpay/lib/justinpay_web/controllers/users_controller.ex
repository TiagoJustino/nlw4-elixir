defmodule JustinpayWeb.UsersController do
  use JustinpayWeb, :controller

  alias Justinpay.User

  action_fallback JustinpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Justinpay.create_user(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", user: user)
    end
  end
end
