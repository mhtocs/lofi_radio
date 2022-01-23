defmodule LofiRadio.Song.Item do
  use Ecto.Schema

  import Ecto.Changeset

  schema "song_items" do
    field(:duration, :integer)
  end

  @doc """
  Make a changeset by casting params into struct
  """
  def changeset(struct, params) do
    cast(struct, params, [:duration])
  end
end
