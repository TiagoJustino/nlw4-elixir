defmodule Justinpay.Account.Deposit do
  alias Justinpay.Account.Operation
  alias Ecto.Multi

  def call(params) do
    Multi.new()
    |> Operation.call(params, :deposit)
    |> Operation.run_transaction(:deposit)
  end
end
