defmodule JustinpayWeb.AccountsView do
  alias Justinpay.Account

  def render("update.json", %{account: %Account{balance: balance, id: id}}) do
    %{
      message: "Balance changed",
      account: %{
        id: id,
        balance: balance
      }
    }
  end
end
