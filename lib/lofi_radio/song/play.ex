defmodule LofiRadio.Song.Play do
  use Ecto.Schema

  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset

  schema "song_plays" do
    field(:started, :utc_datetime)
    belongs_to(:item, LofiRadio.Song.Item)
    field(:remaining, :integer, virtual: true)
  end

  @doc """
  Make changeset by casting params onto struct and putting song
  item accociation

  ## Examples
      
  iex> changeset = LofiRadio.Song.Play.changeset(%LofiRadio.Song.Play{}, 
    %{started: DateTime.utc_now()}, %LofiRadio.Song.Item{duration: 50_000})
  #Ecto.Changeset<
  action: nil,
  changes: %{
    item: #Ecto.Changeset<action: :insert, changes: %{}, errors: [],
     data: #LofiRadio.Song.Item<>, valid?: true>,
    started: ~U[2022-01-26 09:48:30Z]
  },
  errors: [],
  data: #LofiRadio.Song.Play<>,
  valid?: true
  """
  def changeset(struct, params, item) do
    struct
    |> cast(params, [:started])
    |> put_assoc(:item, item)
  end

  @doc """
  Query to get the last played song 
  """
  def last do
    from(p in __MODULE__,
      preload: [:item],
      order_by: [desc: p.started],
      limit: 1
    )
  end

  @doc """
  Calculate the remaining field of the struct
  """
  def remaining(struct, now) do
    elapsed = DateTime.diff(now, struct.started, :millisecond)
    remaining = struct.item.duration - elapsed
    Map.put(struct, :remaining, remaining)
  end
end
