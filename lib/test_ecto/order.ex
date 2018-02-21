defmodule TestEcto.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestEcto.{Repo, User}

  schema "orders" do
    field :amount, :integer

    belongs_to :user, User
  end

  def changeset(order, params \\ %{}) do
    user = get_user(params)
    order
    |> cast(params, [:amount])
    |> validate_required([:amount])
    |> put_assoc(:user, user, required: true)
  end

  def get_user(%{user: %{id: id}} = params) do
    user = Repo.get(User, id)
    params_user = params[:user]
    params_user
    |> Map.keys()
    |> case do
         [:id] -> user
         _keys -> user |> User.changeset(params_user)
       end
  end


  def get_user(%{user: user}) do
    user
  end
end

