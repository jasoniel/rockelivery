defmodule Rockelivery.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:age, :address, :cep, :cpf, :email, :password, :name]

  @derive {Jason.Encoder, only: [:id, :age, :cpf, :address, :email, :name]}

  schema "users" do
    field(:address, :string)
    field(:age, :integer)
    field(:cep, :string)
    field(:cpf, :string)
    field(:email, :string)
    field(:name, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)

    has_many :orders, Order

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end