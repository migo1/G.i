defmodule Gi.Comments.Comment do
  @moduledoc """
  Documentation for Gi.Comments.Comment module.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :markup_text, :string
    belongs_to :user, Gi.Accounts.User
    belongs_to :gist, Gi.Gists.Gist

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:markup_text, :user_id, :gist_id])
    |> validate_required([:markup_text, :user_id, :gist_id])
  end
end
