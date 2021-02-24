defmodule Justinpay do
  alias Justinpay.Users.Create, as: UserCreate
  defdelegate create_user(params), to: UserCreate, as: :call
end
