defmodule LofiRadio.Migrations.AddSongItemsTable do
  use Ecto.Migration

  def change do
    create table("song_items") do
      add(:duration, :integer)
    end

    alter table("song_plays") do
      add(:song_item_id, references("song_items"))
    end
  end
end
