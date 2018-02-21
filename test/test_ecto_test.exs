defmodule TestEctoTest do
  use ExUnit.Case
  doctest TestEcto

  alias TestEcto.{Repo, User, Order}

  test "insert new order and new user" do
    params = %{amount: 1, user: %{name: "New user"}}
    {:ok, %{user: %{id: id}}} = %Order{}
    |> Order.changeset(params)
    |> Repo.insert()

    assert(is_integer(id))
  end

  test "insert new order with exist user" do
    {:ok, %{id: user_id}} = %User{}
    |> User.changeset(%{name: "User created"})
    |> Repo.insert()

    params = %{amount: 1, user: %{id: user_id}}
    {:ok, %{user: %{id: id}}} = %Order{}
    |> Order.changeset(params)
    |> Repo.insert()

    assert id == user_id
  end

  test "update order and update user too" do
    new_name = "User updated"
    {:ok, %{id: user_id}} = %User{}
    |> User.changeset(%{name: "User created"})
    |> Repo.insert()

    params = %{amount: 1, user: %{id: user_id, name: new_name}}
    {:ok, %{user: %{id: id, name: name}}} = %Order{}
    |> Order.changeset(params)
    |> Repo.insert()

    assert id == user_id
    assert name == new_name
  end

end
