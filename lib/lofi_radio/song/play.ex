defmodule LofiRadio.Song.Play do
  use Ecto.Schema

  import Ecto.Query, only: [from: 2]

  schema "song_plays" do
    field(:started, :utc_datetime)
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
