defmodule Gi.Gists.Gist do
  @moduledoc """
  Documentation for Gi.Accounts.UserToken module.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "gists" do
    field :name, :string
    field :description, :string
    field :markup_text, :string
    belongs_to :user, Gi.Accounts.User
    has_many :comments, Gi.Comments.Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(gist, attrs) do
    gist
    |> cast(attrs, [:name, :description, :markup_text, :user_id])
    |> validate_required([:name, :user_id])
  end
end
