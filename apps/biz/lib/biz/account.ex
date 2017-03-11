defmodule Biz.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Biz.{User,Slug,Repo}

  schema "accounts" do
    field :name, :string
    field :slug, :string
    field :amount, :decimal
    field :type, :string
    belongs_to :user, User
    timestamps()
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(Slug.merge(params), [:name, :slug, :amount, :type, :user_id])
    |> foreign_key_constraint(:user_id)
  end

end