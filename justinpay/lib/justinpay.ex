defmodule Justinpay do
  alias Justinpay.Users.Create, as: UserCreate
  alias Justinpay.Account.Deposit, as: AccountDeposit
  alias Justinpay.Account.Withdraw, as: AccountWithdraw

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: AccountDeposit, as: :call
  defdelegate withdraw(params), to: AccountWithdraw, as: :call
end
