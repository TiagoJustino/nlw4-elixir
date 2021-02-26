defmodule Justinpay.Account do
  use Ecto.Schema

  import Ecto.Changeset

  alias Justinpay.User

  @primary_key {:id, :id, autogenerate: true}

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_not_be_negative)
  end
end
