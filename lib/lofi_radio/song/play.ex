defmodule LofiRadio.Song.Play do
  use Ecto.Schema

  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset

  schema "song_plays" do
    field(:started, :utc_datetime)
    belongs_to(:song_item, LofiRadio.Song.Item)
  end

  @doc """
  Make changeset by casting params onto struct and putting song
  item accociation
  """
  def changeset(struct, params, song_item) do
    struct
    |> cast(params, [:started])
    |> put_assoc(:song_item, song_item)
  end

  @doc """
  Query to get the last played song 
  """
  def last do
    from(p in __MODULE__,
      order_by: [desc: p.started],
      limit: 1
    )
  end
end
