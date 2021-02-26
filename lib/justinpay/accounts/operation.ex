defmodule Justinpay.Account.Operation do
  alias Ecto.Multi
  alias Justinpay.{Account, Repo}

  def call(multi, %{"id" => id, "value" => value}, operation) do
    op_name = operation_name(operation)
    multi
    |> Multi.run(op_name, fn repo, _changes -> get_account(repo, id) end)
    |> Multi.run(operation, fn repo, changes ->
      update_balance(repo, Map.get(changes, op_name), value, operation)
    end)
  end

  defp get_account(repo, id) do
    case repo.get(Account, id) do
      nil -> {:error, "account not found"}
      account -> {:ok, account}
    end
  end

  defp update_balance(repo, account, value, operation) do
    account
    |> operation(value, operation)
    |> update_account(repo, account)
  end

  defp operation(%Account{balance: balance}, value, operation) do
    value
    |> Decimal.cast()
    |> handle_cast(balance, operation)
  end

  defp handle_cast({:ok, value}, balance, :deposit), do: Decimal.add(balance, value)
  defp handle_cast({:ok, value}, balance, :withdraw), do: Decimal.sub(balance, value)
  defp handle_cast(:error, _balance, _operation), do: {:error, "Invalid value"}

  defp update_account({:error, _reason} = error, _repo, _account), do: error

  defp update_account(value, repo, account) do
    params = %{balance: value}

    account
    |> Account.changeset(params)
    |> repo.update()
  end

  def run_transaction(multi, operation) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, changes} -> {:ok, Map.get(changes, operation)}
    end
  end

  defp operation_name(operation) do
    "update_#{Atom.to_string(operation)}"
    |> String.to_atom()
  end
end
