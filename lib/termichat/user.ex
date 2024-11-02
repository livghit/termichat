defmodule Termichat.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:name, :string)
    field(:username, :string)
    field(:email, :string)
    field(:password, :string)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password, :email, :username])
    |> validate_required([:name, :password, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, 20)
    |> unique_constraint(:email)
  end
end
