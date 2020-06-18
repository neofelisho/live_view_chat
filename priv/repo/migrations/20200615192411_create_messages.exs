defmodule LiveViewChat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :room_id, references(:rooms, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)
      add :content, :string

      timestamps()
    end

    create index(:messages, [:room_id])
    create index(:messages, [:user_id])
  end
end
