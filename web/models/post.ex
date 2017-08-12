defmodule ElixirApp.Post do
  use ElixirApp.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, ElixirApp.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(title)a
  @optional_fields ~w(body)a

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
