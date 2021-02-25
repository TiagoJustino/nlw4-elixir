defmodule JustinpayWeb.AccountsController do
  use JustinpayWeb, :controller

  alias Justinpay.Account

  action_fallback JustinpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = user} <- Justinpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", user: user)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = user} <- Justinpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", user: user)
    end
  end
end
