defmodule TestEcto.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestEcto.Order

  schema "users" do
    field :name, :string

    has_many :orders, Order
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name])
    |> validate_required([:name])
    |> cast_assoc(:orders)
  end

end
