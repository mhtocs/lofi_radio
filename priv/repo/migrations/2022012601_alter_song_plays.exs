defmodule LofiRadio.Migrations.AlterSongPlaysTable do
  use Ecto.Migration

  def change do
    rename(table("song_plays"), :song_item_id, to: :item_id)
  end
end
