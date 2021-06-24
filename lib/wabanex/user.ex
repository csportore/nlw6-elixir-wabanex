defmodule Wabanex.User do
  # use importa qualquer código acessível
  use Ecto.Schema
  # import importa funções
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :password, :name]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    # Esse __MODULE__ se refere ao módulo onde ele se encontra
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    # Verifica se não existe outro email antes de gravar
    # Essa verificação é feita através de query no banco
    |> unique_constraint([:email])
  end
end
