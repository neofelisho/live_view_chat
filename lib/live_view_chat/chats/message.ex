defmodule LiveViewChat.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveViewChat.Chats.Room
  alias LiveViewChat.Users.User

  schema "messages" do
    belongs_to :room, Room
    belongs_to :user, User
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
