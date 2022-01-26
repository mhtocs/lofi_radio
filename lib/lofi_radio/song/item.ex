defmodule LofiRadio.Song.Item do
  use Ecto.Schema

  import Ecto.Changeset

  schema "song_items" do
    field(:duration, :integer)
  end

  @doc """
  Make a changeset by casting params into struct

  ## Examples
      
  iex>  changeset = LofiRadio.Song.Item.changeset(
    %LofiRadio.Song.Item{},%{duration: 20_000}
  )
  #Ecto.Changeset<
  action: nil,
  changes: %{duration: 20000},
  errors: [],
  data: #LofiRadio.Song.Item<>,
  valid?: true

  """
  def changeset(struct, params) do
    cast(struct, params, [:duration])
  end
end
