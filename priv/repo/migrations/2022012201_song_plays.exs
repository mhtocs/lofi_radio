defmodule LofiRadio.Migrations.AddSongPlaysTable do
  use Ecto.Migration

  def change do
    create table("song_plays") do
      add(:started, :utc_datetime)
    end
  end
end
