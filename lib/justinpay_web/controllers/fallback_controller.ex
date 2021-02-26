defmodule JustinpayWeb.FallbackController do
  use JustinpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(JustinpayWeb.ErrorView)
    |> render("400.json", result: result)
  end

  def call(conn, message) do
    conn
    |> put_status(:bad_request)
    |> put_view(JustinpayWeb.ErrorView)
    |> render("400.json", result: message)
  end
end
