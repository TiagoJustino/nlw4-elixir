defmodule Justinpay.Users.Create do
  alias Justinpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
