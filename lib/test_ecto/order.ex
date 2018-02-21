defmodule TestEcto.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestEcto.User

  schema "orders" do
    field :amount, :integer

    belongs_to :user, User
  end

  def changeset(order, params \\ %{}) do
    order
    |> cast(params, [:amount])
    |> validate_required([:amount])
    |> cast_assoc(:user, required: true)
  end

end
