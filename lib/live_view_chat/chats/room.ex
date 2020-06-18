defmodule LiveViewChat.Chats.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveViewChat.Chats.Message

  schema "rooms" do
    field :name, :string
    has_many :message, Message

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
