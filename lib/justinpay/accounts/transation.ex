defmodule Justinpay.Account.Transaction do
  alias Ecto.Multi
  alias Justinpay.Account.Operation

  def call(%{"id" => id, "to" => to, "value" => value}) do
    Multi.new()
    |> Operation.call(%{"id" => id, "value" => value}, :withdraw)
    |> Operation.call(%{"id" => to, "value" => value}, :deposit)
    |> Operation.run_transaction(:withdraw)
  end
end
