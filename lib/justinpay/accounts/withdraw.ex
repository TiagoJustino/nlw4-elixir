defmodule Justinpay.Account.Withdraw do
  alias Justinpay.Account.Operation
  alias Ecto.Multi

  def call(params) do
    Multi.new()
    |> Operation.call(params, :withdraw)
    |> Operation.run_transaction(:withdraw)
  end
end
