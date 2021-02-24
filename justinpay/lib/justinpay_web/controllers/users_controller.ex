
defmodule JustinpayWeb.UsersController do
  use JustinpayWeb, :controller

  alias Justinpay.User

  def create(conn, params) do
    Justinpay.create_user(params)
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", user: user)

  end

  defp handle_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(JustinpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
