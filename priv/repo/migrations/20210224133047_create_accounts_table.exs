defmodule Justinpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table :accounts do
      add :balance, :decimal
      add :user_id, references(:users)

      timestamps()
    end

    create constraint(:accounts, :balance_must_not_be_negative, check: "balance >= 0")
  end
end
