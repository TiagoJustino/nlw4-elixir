defmodule JustinpayWeb.AccountsController do
  use JustinpayWeb, :controller

  alias Justinpay.Account

  action_fallback JustinpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Justinpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Justinpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %Account{} = account} <- Justinpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
