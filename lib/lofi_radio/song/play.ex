defmodule LofiRadio.Song.Play do
  use Ecto.Schema

  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset

  schema "song_plays" do
    field(:started, :utc_datetime)
    belongs_to(:song_item, LofiRadio.Song.Item)
    field(:remaining, :integer, virtual: true)
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
      preload: [:song_item],
      order_by: [desc: p.started],
      limit: 1
    )
  end

  @doc """
  Calculate the remaining field of the struct
  """
  def remaining(struct) do
    now = DateTime.utc_now()
    elapsed = DateTime.diff(now, struct.started, :millisecond)
    remaining = struct.song_item.duration - elapsed
    Map.put(struct, :remaining, remaining)
  end
end
