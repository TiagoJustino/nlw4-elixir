defmodule Justinpay.Repo do
  use Ecto.Repo,
    otp_app: :justinpay,
    adapter: Ecto.Adapters.Postgres
end
